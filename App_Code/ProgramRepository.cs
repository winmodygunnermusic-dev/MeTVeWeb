using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

public static class ProgramRepository
{
    public static IList<ProgramSlot> GetSchedule(DateTime day)
    {
        var slots = new List<ProgramSlot>();
        var connStr = ConfigurationManager.ConnectionStrings["MeTVeDb"].ConnectionString;
        using (var conn = new SqlConnection(connStr))
        using (var cmd = new SqlCommand(@"SELECT Id, ChannelId, Title, StartTime, EndTime, MediaId
FROM Programs
WHERE CAST(StartTime AS date) = @date
ORDER BY ChannelId, StartTime", conn))
        {
            cmd.Parameters.AddWithValue("@date", day.Date);
            conn.Open();
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    slots.Add(new ProgramSlot
                    {
                        Id = reader.GetInt32(0),
                        ChannelId = reader.GetInt32(1),
                        Title = reader.GetString(2),
                        StartTime = reader.GetDateTime(3),
                        EndTime = reader.GetDateTime(4),
                        MediaId = reader.GetInt32(5)
                    });
                }
            }
        }

        return slots;
    }
}
