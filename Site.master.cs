using System;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblUser.Text = Context.User != null && Context.User.Identity.IsAuthenticated
            ? "Signed in as " + Context.User.Identity.Name
            : "Guest mode";
    }
}
