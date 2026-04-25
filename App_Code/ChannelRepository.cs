using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

public static class ChannelRepository
{
    public static IList<Channel> GetAllChannels()
    {
        var channels = new List<Channel>();
        var connStr = ConfigurationManager.ConnectionStrings["MeTVeDb"].ConnectionString;

        using (var conn = new SqlConnection(connStr))
        using (var cmd = new SqlCommand("SELECT Id, Name, StreamUrl, SourceType, IsNostalgiaMode FROM Channels ORDER BY Name", conn))
        {
            conn.Open();
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    channels.Add(new Channel
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        StreamUrl = reader.IsDBNull(2) ? string.Empty : reader.GetString(2),
                        SourceType = reader.IsDBNull(3) ? "Live" : reader.GetString(3),
                        IsNostalgiaMode = !reader.IsDBNull(4) && reader.GetBoolean(4)
                    });
                }
            }
        }

        return channels;
    }

    public static int CreateChannel(string name, string streamUrl, string sourceType)
    {
        var connStr = ConfigurationManager.ConnectionStrings["MeTVeDb"].ConnectionString;
        using (var conn = new SqlConnection(connStr))
        using (var cmd = new SqlCommand(@"INSERT INTO Channels (Name, StreamUrl, SourceType, IsNostalgiaMode)
VALUES (@name, @streamUrl, @sourceType, 1);
SELECT CAST(SCOPE_IDENTITY() as int);", conn))
        {
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@streamUrl", streamUrl);
            cmd.Parameters.AddWithValue("@sourceType", sourceType);
            conn.Open();
            return (int)cmd.ExecuteScalar();
        }
    }
}
