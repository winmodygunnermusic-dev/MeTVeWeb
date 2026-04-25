<%@ Application Language="C#" %>
<script runat="server">
    void Session_Start(object sender, EventArgs e)
    {
        Application.Lock();
        var online = Application["OnlineUsers"] == null ? 0 : (int)Application["OnlineUsers"];
        Application["OnlineUsers"] = online + 1;
        Application.UnLock();
    }

    void Session_End(object sender, EventArgs e)
    {
        Application.Lock();
        var online = Application["OnlineUsers"] == null ? 0 : (int)Application["OnlineUsers"];
        Application["OnlineUsers"] = Math.Max(online - 1, 0);
        Application.UnLock();
    }
</script>
