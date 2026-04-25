<%@ Page Title="Channels" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
  <div class="panel"><h2>Channel Directory</h2>
  <label>Search Channel</label><asp:TextBox runat="server" ID="txtSearch" />
  <br /><asp:Button runat="server" Text="Find" CssClass="btn" OnClick="SearchChannels" />
  <asp:GridView runat="server" ID="gvChannels" CssClass="grid" AutoGenerateColumns="false">
    <Columns>
      <asp:BoundField DataField="Id" HeaderText="ID" />
      <asp:BoundField DataField="Name" HeaderText="Name" />
      <asp:BoundField DataField="SourceType" HeaderText="Source" />
      <asp:CheckBoxField DataField="IsLive" HeaderText="Live" />
      <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Watch.aspx?id={0}" Text="Watch" />
    </Columns>
  </asp:GridView></div>
</asp:Content>
<script runat="server">
private void BindChannels(){ gvChannels.DataSource = MeTVeRepository.GetChannels(); gvChannels.DataBind(); }
protected void Page_Load(object sender, EventArgs e) { if(!IsPostBack){ BindChannels(); } }
protected void SearchChannels(object sender, EventArgs e) {
  var results = MeTVeRepository.GetChannels().FindAll(delegate(Channel c) {
    return c.Name != null && c.Name.ToLower().Contains(txtSearch.Text.ToLower());
  });
  gvChannels.DataSource = results;
  gvChannels.DataBind();
}
</script>
