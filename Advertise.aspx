<%@ Page Title="Advertise" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Advertise Your Project</h2>
<label>Campaign Name</label><asp:TextBox runat="server" ID="txtCampaign" />
<label>Details</label><asp:TextBox runat="server" ID="txtDetails" TextMode="MultiLine" Rows="4" />
<br /><br /><asp:Button runat="server" Text="Submit" CssClass="btn" />
</div>
</asp:Content>
