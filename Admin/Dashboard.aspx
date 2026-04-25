<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Control Panel</h2>
<ul>
<li><a href="/Admin/Channels.aspx">Channel Overview</a></li>
<li><a href="/Admin/Scheduler.aspx">Scheduler</a></li>
<li><a href="/Admin/MediaLibrary.aspx">Media Library</a></li>
<li><a href="/Admin/SMS.aspx">SMS Moderation</a></li>
<li><a href="/Admin/Analytics.aspx">Analytics</a></li>
</ul>
</div>
</asp:Content>
