<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
  <div class="split">
    <div class="panel">
      <h2>Featured Channels <span class="badge">Cable Style</span></h2>
      <asp:Repeater runat="server" ID="rptFeatured">
        <ItemTemplate><div><a href='/Watch.aspx?id=<%# Eval("Id") %>'><%# Eval("Name") %></a> - <%# Eval("Description") %></div></ItemTemplate>
      </asp:Repeater>
    </div>
    <div class="panel">
      <h2>Live Right Now</h2>
      <asp:Repeater runat="server" ID="rptLive">
        <ItemTemplate><div>● <a href='/Watch.aspx?id=<%# Eval("Id") %>'><%# Eval("Name") %></a></div></ItemTemplate>
      </asp:Repeater>
      <div id="legacyNotice" class="notice small">Polling live channel status every 15 seconds (HTTP polling, no sockets).</div>
    </div>
  </div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e) {
  if(!IsPostBack){
    rptFeatured.DataSource = MeTVeRepository.GetFeaturedChannels();
    rptFeatured.DataBind();
    rptLive.DataSource = MeTVeRepository.GetLiveChannels();
    rptLive.DataBind();
  }
}
</script>
