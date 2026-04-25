using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

[WebService(Namespace = "http://metve.tv/services")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class ChannelService : WebService
{
    [WebMethod]
    public string CreateChannel(string name)
    {
        var connStr = ConfigurationManager.ConnectionStrings["MeTVeDb"].ConnectionString;
        using (var conn = new SqlConnection(connStr))
        using (var cmd = new SqlCommand("INSERT INTO Channels (Name, SourceType, IsNostalgiaMode) VALUES (@name, 'Live', 1)", conn))
        {
            cmd.Parameters.AddWithValue("@name", name);
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        return "OK";
    }
}
