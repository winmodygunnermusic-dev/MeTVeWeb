<%@ Page Title="SMS" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>SMS + Chat Moderation</h2>
<p>Pipeline: ingest → queue → moderation → on-air overlay (name + country) with export logs.</p>
<asp:GridView runat="server" ID="gvSms" CssClass="grid" AutoGenerateColumns="false">
  <Columns>
    <asp:BoundField HeaderText="Sender" DataField="Sender" />
    <asp:BoundField HeaderText="Country" DataField="Country" />
    <asp:BoundField HeaderText="Body" DataField="Body" />
  </Columns>
</asp:GridView>
</div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e){
  if(!IsPostBack){
    gvSms.DataSource = new[]{ new { Sender="DemoUser", Country="US", Body="Love this channel!" } };
    gvSms.DataBind();
  }
}
</script>
