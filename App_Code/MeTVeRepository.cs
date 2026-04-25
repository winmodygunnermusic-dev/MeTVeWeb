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
}

public class ProgramItem
{
    public string ChannelName { get; set; }
    public string Title { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
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
            SqlCommand cmd = new SqlCommand("SELECT Id, Name, Description, StreamUrl, SourceType FROM Channels ORDER BY Name", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                channels.Add(new Channel
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]),
                    Description = Convert.ToString(reader["Description"]),
                    StreamUrl = Convert.ToString(reader["StreamUrl"]),
                    SourceType = Convert.ToString(reader["SourceType"]),
                });
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
            SqlCommand cmd = new SqlCommand("SELECT TOP 1 Id, Name, Description, StreamUrl, SourceType FROM Channels WHERE Id=@id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return new Channel
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = Convert.ToString(reader["Name"]),
                    Description = Convert.ToString(reader["Description"]),
                    StreamUrl = Convert.ToString(reader["StreamUrl"]),
                    SourceType = Convert.ToString(reader["SourceType"]),
                };
            }
        }
        return null;
    }

    public static List<ProgramItem> GetPrograms()
    {
        List<ProgramItem> programs = new List<ProgramItem>();
        using (SqlConnection conn = new SqlConnection(ConnStr))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT c.Name AS ChannelName, p.Title, p.StartTime, p.EndTime
                                             FROM Programs p INNER JOIN Channels c ON p.ChannelId = c.Id
                                             ORDER BY p.StartTime", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                programs.Add(new ProgramItem
                {
                    ChannelName = Convert.ToString(reader["ChannelName"]),
                    Title = Convert.ToString(reader["Title"]),
                    StartTime = Convert.ToDateTime(reader["StartTime"]),
                    EndTime = Convert.ToDateTime(reader["EndTime"]),
                });
            }
        }
        return programs;
    }
}
