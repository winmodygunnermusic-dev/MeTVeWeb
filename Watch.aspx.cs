using System;
using System.Linq;

public partial class Watch : System.Web.UI.Page
{
    protected string StreamUrl = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        int channelId;
        if (!int.TryParse(Request.QueryString["id"], out channelId))
        {
            litChannel.Text = "Invalid channel.";
            return;
        }

        var channel = ChannelRepository.GetAllChannels().FirstOrDefault(c => c.Id == channelId);
        if (channel == null)
        {
            litChannel.Text = "Channel not found.";
            return;
        }

        litChannel.Text = channel.Name;
        StreamUrl = channel.StreamUrl;
        livePlayer.Attributes["src"] = StreamUrl;
    }
}
