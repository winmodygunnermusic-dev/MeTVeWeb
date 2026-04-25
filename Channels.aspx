<%@ Page Title="Channels" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
  <div class="panel"><h2>Channel Directory</h2>
  <asp:GridView runat="server" ID="gvChannels" CssClass="grid" AutoGenerateColumns="false">
    <Columns>
      <asp:BoundField DataField="Id" HeaderText="ID" />
      <asp:BoundField DataField="Name" HeaderText="Name" />
      <asp:BoundField DataField="SourceType" HeaderText="Source" />
      <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Watch.aspx?id={0}" Text="Watch" />
    </Columns>
  </asp:GridView></div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e) {
  if(!IsPostBack){ gvChannels.DataSource = MeTVeRepository.GetChannels(); gvChannels.DataBind(); }
}
</script>
