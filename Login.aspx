<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Login</h2>
<asp:Login runat="server" DestinationPageUrl="~/Default.aspx" />
</div>
</asp:Content>
