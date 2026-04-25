<%@ WebService Language="C#" Class="ChannelApi" %>
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

[WebService(Namespace = "http://metve.tv/")]
public class ChannelApi : WebService
{
    [WebMethod]
    public string CreateChannel(string name)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MeTVeDb"].ConnectionString))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Channels (Name, SourceType) VALUES (@name, 'Live')", conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.ExecuteNonQuery();
        }
        return "OK";
    }
}
