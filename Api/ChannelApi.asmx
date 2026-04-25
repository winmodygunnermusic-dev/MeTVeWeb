<%@ WebService Language="C#" Class="ChannelApi" %>
using System.Web.Services;

[WebService(Namespace = "http://metve.tv/")]
public class ChannelApi : WebService
{
    [WebMethod]
    public string SaveChannel(string name, string description, string streamUrl)
    {
        int id = MeTVeRepository.SaveChannel(name, description, streamUrl, "Live", true);
        return "OK:" + id;
    }
}
