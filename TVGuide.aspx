<%@ Page Title="TV Guide" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>EPG Grid</h2>
<p>
  <asp:Button runat="server" Text="Daily" CssClass="btn" OnClick="LoadDaily" />
  <asp:Button runat="server" Text="Weekly" CssClass="btn" OnClick="LoadWeekly" />
  <a class="btn" href="/Api/GuideApi.asmx/ExportJson" style="text-decoration:none;">Export JSON</a>
  <a class="btn" href="/Api/GuideApi.asmx/ExportXmlTv" style="text-decoration:none;">Export XMLTV</a>
</p>
<asp:GridView runat="server" ID="gvGuide" CssClass="grid" AutoGenerateColumns="false">
<Columns>
<asp:BoundField DataField="ChannelName" HeaderText="Channel" />
<asp:BoundField DataField="Title" HeaderText="Program" />
<asp:BoundField DataField="Category" HeaderText="Category" />
<asp:BoundField DataField="DurationMinutes" HeaderText="Minutes" />
<asp:BoundField DataField="StartTime" HeaderText="Start" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
<asp:BoundField DataField="EndTime" HeaderText="End" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
</Columns>
</asp:GridView></div>
</asp:Content>
<script runat="server">
private void BindWindow(DateTime fromUtc, DateTime toUtc){ gvGuide.DataSource = MeTVeRepository.GetProgramsWindow(fromUtc, toUtc); gvGuide.DataBind(); }
protected void Page_Load(object sender, EventArgs e){ if(!IsPostBack){ LoadDaily(sender,e); } }
protected void LoadDaily(object sender, EventArgs e){ var d = DateTime.UtcNow.Date; BindWindow(d, d.AddDays(1)); }
protected void LoadWeekly(object sender, EventArgs e){ var d = DateTime.UtcNow.Date; BindWindow(d, d.AddDays(7)); }
</script>
