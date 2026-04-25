using System;

public partial class AdminChannels : System.Web.UI.Page
{
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        var channelId = ChannelRepository.CreateChannel(txtName.Text.Trim(), txtUrl.Text.Trim(), ddlSource.SelectedValue);
        lblStatus.Text = "Channel saved with id " + channelId + ".";
    }
}
