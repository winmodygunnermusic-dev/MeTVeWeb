<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
  <div class="panel">
    <h2>Featured Channels</h2>
    <asp:Repeater runat="server" ID="rptChannels">
      <ItemTemplate><div><a href='/Watch.aspx?id=<%# Eval("Id") %>'><%# Eval("Name") %></a> - <%# Eval("Description") %></div></ItemTemplate>
    </asp:Repeater>
  </div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e) {
  if(!IsPostBack){ rptChannels.DataSource = MeTVeRepository.GetChannels(); rptChannels.DataBind(); }
}
</script>
