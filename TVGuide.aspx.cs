using System;

public partial class TVGuide : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvGuide.DataSource = ProgramRepository.GetSchedule(DateTime.UtcNow);
            gvGuide.DataBind();
        }
    }
}
