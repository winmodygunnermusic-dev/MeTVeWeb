<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
  <div class="card"><h2>Login</h2><asp:Login ID="LoginControl" runat="server" DestinationPageUrl="~/Default.aspx" /></div>
</asp:Content>
