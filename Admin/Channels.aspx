<%@ Page Title="Admin Channels" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Channels.aspx.cs" Inherits="AdminChannels" %>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
  <div class="card">
    <h2>Channel Creation</h2>
    <asp:TextBox ID="txtName" runat="server" placeholder="Channel Name" />
    <asp:TextBox ID="txtUrl" runat="server" placeholder="Stream URL (.m3u8/.m3u)" Width="320" />
    <asp:DropDownList ID="ddlSource" runat="server"><asp:ListItem>Live</asp:ListItem><asp:ListItem>Playlist loop</asp:ListItem><asp:ListItem>Scheduled playout</asp:ListItem></asp:DropDownList>
    <asp:Button ID="btnCreate" runat="server" Text="Save Channel" OnClick="btnCreate_Click" />
    <asp:Label ID="lblStatus" runat="server" />
  </div>
</asp:Content>
