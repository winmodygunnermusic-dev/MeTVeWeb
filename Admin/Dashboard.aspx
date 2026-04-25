<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Operator Control Panel</h2>
<ul>
<li><a href="/Admin/Channels.aspx">Channel Overview / Channel Builder</a></li>
<li><a href="/Admin/Scheduler.aspx">Scheduler / Timeline</a></li>
<li><a href="/Admin/MediaLibrary.aspx">Media Library</a></li>
<li><a href="/Admin/SMS.aspx">SMS Moderation + Chat</a></li>
<li><a href="/Admin/Analytics.aspx">Analytics</a></li>
</ul>
<p class="small">Live preview + overlay trigger controls are designed for polling updates (no sockets).</p>
</div>
</asp:Content>
