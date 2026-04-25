using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

public class Channel
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public string StreamUrl { get; set; }
    public string SourceType { get; set; }
    public bool IsLive { get; set; }
}

public class ProgramItem
{
    public int Id { get; set; }
    public string ChannelName { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public string Category { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public int DurationMinutes { get; set; }
}

public class SchedulerAlert
{
    public string ChannelName { get; set; }
    public string Message { get; set; }
}

public static class MeTVeRepository
{
    private static readonly string ConnStr = ConfigurationManager.ConnectionStrings["MeTVeDb"].ConnectionString;

    public static List<Channel> GetChannels()
    {
        List<Channel> channels = new List<Channel>();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Id, Name, Description, StreamUrl, SourceType, IsLive FROM Channels ORDER BY Name", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                channels.Add(MapChannel(reader));
            }
        }
        return channels;
    }

    public static List<Channel> GetFeaturedChannels()
    {
        List<Channel> channels = new List<Channel>();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT TOP 6 Id, Name, Description, StreamUrl, SourceType, IsLive FROM Channels ORDER BY LastUpdatedUtc DESC", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                channels.Add(MapChannel(reader));
            }
        }
        return channels;
    }

    public static List<Channel> GetLiveChannels()
    {
        List<Channel> channels = new List<Channel>();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Id, Name, Description, StreamUrl, SourceType, IsLive FROM Channels WHERE IsLive = 1 ORDER BY Name", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                channels.Add(MapChannel(reader));
            }
        }
        return channels;
    }

    public static Channel GetChannel(string id)
    {
        if (string.IsNullOrEmpty(id)) return null;
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT TOP 1 Id, Name, Description, StreamUrl, SourceType, IsLive FROM Channels WHERE Id=@id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return MapChannel(reader);
            }
        }
        return null;
    }

    public static List<ProgramItem> GetPrograms()
    {
        return GetProgramsWindow(DateTime.UtcNow.Date, DateTime.UtcNow.Date.AddDays(1));
    }

    public static List<ProgramItem> GetProgramsWindow(DateTime fromUtc, DateTime toUtc)
    {
        List<ProgramItem> programs = new List<ProgramItem>();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT p.Id, c.Name AS ChannelName, p.Title, p.Description, p.Category, p.StartTime, p.EndTime,
                                              DATEDIFF(minute, p.StartTime, p.EndTime) AS DurationMinutes
                                             FROM Programs p INNER JOIN Channels c ON p.ChannelId = c.Id
                                             WHERE p.StartTime >= @fromUtc AND p.StartTime < @toUtc
                                             ORDER BY p.StartTime", conn);
            cmd.Parameters.AddWithValue("@fromUtc", fromUtc);
            cmd.Parameters.AddWithValue("@toUtc", toUtc);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                programs.Add(new ProgramItem
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    ChannelName = Convert.ToString(reader["ChannelName"]),
                    Title = Convert.ToString(reader["Title"]),
                    Description = Convert.ToString(reader["Description"]),
                    Category = Convert.ToString(reader["Category"]),
                    StartTime = Convert.ToDateTime(reader["StartTime"]),
                    EndTime = Convert.ToDateTime(reader["EndTime"]),
                    DurationMinutes = Convert.ToInt32(reader["DurationMinutes"])
                });
            }
        }
        return programs;
    }

    public static List<SchedulerAlert> GetSchedulerAlerts()
    {
        List<SchedulerAlert> alerts = new List<SchedulerAlert>();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT c.Name AS ChannelName,
                                             'Potential overlap near ' + CONVERT(varchar(16), p.StartTime, 120) AS Message
                                             FROM Programs p
                                             INNER JOIN Channels c ON p.ChannelId = c.Id
                                             WHERE EXISTS (
                                                 SELECT 1 FROM Programs p2
                                                 WHERE p2.ChannelId = p.ChannelId
                                                   AND p2.Id <> p.Id
                                                   AND p.StartTime < p2.EndTime
                                                   AND p.EndTime > p2.StartTime)
                                             ORDER BY c.Name", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                alerts.Add(new SchedulerAlert
                {
                    ChannelName = Convert.ToString(reader["ChannelName"]),
                    Message = Convert.ToString(reader["Message"])
                });
            }
        }
        return alerts;
    }

    public static int SaveChannel(string name, string description, string streamUrl, string sourceType, bool isLive)
    {
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(@"INSERT INTO Channels (Name, Description, StreamUrl, SourceType, IsLive, LastUpdatedUtc)
                                              VALUES (@name, @description, @streamUrl, @sourceType, @isLive, GETUTCDATE());
                                              SELECT CAST(SCOPE_IDENTITY() AS INT);", conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@streamUrl", streamUrl);
            cmd.Parameters.AddWithValue("@sourceType", sourceType);
            cmd.Parameters.AddWithValue("@isLive", isLive);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }
    }

    private static Channel MapChannel(SqlDataReader reader)
    {
        return new Channel
        {
            Id = Convert.ToInt32(reader["Id"]),
            Name = Convert.ToString(reader["Name"]),
            Description = Convert.ToString(reader["Description"]),
            StreamUrl = Convert.ToString(reader["StreamUrl"]),
            SourceType = Convert.ToString(reader["SourceType"]),
            IsLive = Convert.ToBoolean(reader["IsLive"])
        };
    }
}
