using System;

public partial class Channels : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvChannels.DataSource = ChannelRepository.GetAllChannels();
            gvChannels.DataBind();
        }
    }
}
