<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Register</h2>
<asp:CreateUserWizard runat="server" ContinueDestinationPageUrl="~/Profile.aspx" />
</div>
</asp:Content>
