<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Profile</h2>
<p>Welcome, <asp:LoginName runat="server" />.</p>
<p>Online users (session): <asp:Literal runat="server" ID="litOnline" /></p>
</div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e){
  Application.Lock();
  if(Application["OnlineUsers"] == null) Application["OnlineUsers"] = 1;
  litOnline.Text = Application["OnlineUsers"].ToString();
  Application.UnLock();
}
</script>
