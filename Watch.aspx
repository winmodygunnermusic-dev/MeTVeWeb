<%@ Page Title="Watch" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="split">
<div class="panel"><h2><asp:Literal runat="server" ID="litTitle" /></h2>
<video controls autoplay width="640" height="480">
  <source runat="server" id="hlsSource" type="application/x-mpegURL" />
</video>
<object id="legacyPlayer" width="640" height="480" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
  <param name="URL" runat="server" id="wmpSource" />
</object>
<p class="small">Legacy mode: WMP object fallback for Windows XP/Vista.</p>
</div>
<div class="panel">
  <h3>Social Interaction</h3>
  <p>SMS / Chat / Poll overlay API-ready (polling based).</p>
  <label>Chat Message</label><asp:TextBox runat="server" ID="txtChat" />
  <asp:Button runat="server" ID="btnChat" Text="Send" CssClass="btn" />
  <hr />
  <label>Vote</label>
  <select><option>Option A</option><option>Option B</option></select>
  <button type="button" class="btn">Submit Vote</button>
</div>
</div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e) {
  var channelId = Request.QueryString["id"];
  var channel = MeTVeRepository.GetChannel(channelId);
  litTitle.Text = channel == null ? "Unknown Channel" : channel.Name;
  hlsSource.Attributes["src"] = channel == null ? "" : channel.StreamUrl;
  wmpSource.Attributes["value"] = channel == null ? "" : channel.StreamUrl;
}
</script>
