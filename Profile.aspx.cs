using System;

public partial class Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        litProfile.Text = Context.User.Identity.IsAuthenticated
            ? "Welcome, " + Context.User.Identity.Name + "."
            : "You are currently browsing as guest.";
    }
}
