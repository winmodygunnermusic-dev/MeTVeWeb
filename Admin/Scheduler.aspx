<%@ Page Title="Scheduler" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Scheduler Engine</h2>
<p>Timeline-ready scheduler (legacy web mode) with timezone alignment, fixed-time lock, fillers and conflict alerts.</p>
<asp:GridView runat="server" ID="gvPrograms" CssClass="grid" AutoGenerateColumns="false">
  <Columns>
    <asp:BoundField DataField="ChannelName" HeaderText="Channel" />
    <asp:BoundField DataField="Title" HeaderText="Program" />
    <asp:BoundField DataField="StartTime" HeaderText="Start" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
    <asp:BoundField DataField="EndTime" HeaderText="End" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
  </Columns>
</asp:GridView>
<h3>Smart Alerts</h3>
<asp:Repeater runat="server" ID="rptAlerts"><ItemTemplate><div>⚠ <%# Eval("ChannelName") %>: <%# Eval("Message") %></div></ItemTemplate></asp:Repeater>
</div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e){
  if(!IsPostBack){
    gvPrograms.DataSource = MeTVeRepository.GetProgramsWindow(DateTime.UtcNow.Date, DateTime.UtcNow.Date.AddDays(1));
    gvPrograms.DataBind();
    rptAlerts.DataSource = MeTVeRepository.GetSchedulerAlerts();
    rptAlerts.DataBind();
  }
}
</script>
