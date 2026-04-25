<%@ Page Title="Admin Channels" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Web.Services" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Channel Creation Wizard (3-Step)</h2>
<ol>
  <li><strong>Upload:</strong> ingest media into folders and transcode (optional FFmpeg).</li>
  <li><strong>Design:</strong> choose nostalgia/modern template, logos, ticker, SMS overlay.</li>
  <li><strong>Broadcast:</strong> set schedule, fillers, fixed-time locking, on-air edits.</li>
</ol>
<label>Name</label><asp:TextBox runat="server" ID="txtName" />
<label>Description</label><asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Rows="3" />
<label>Stream URL (.m3u8 / RTMP / HTTP)</label><asp:TextBox runat="server" ID="txtStream" />
<label>Source Type</label>
<asp:DropDownList runat="server" ID="ddlSource">
  <asp:ListItem Text="Live" Value="Live" />
  <asp:ListItem Text="Playlist" Value="Playlist" />
  <asp:ListItem Text="Scheduled Playout" Value="Scheduled" />
</asp:DropDownList>
<asp:CheckBox runat="server" ID="chkLive" Text="Currently Live" />
<br /><br />
<asp:Button runat="server" Text="Save Channel" CssClass="btn" OnClientClick="return saveChannelAjax();" />
<div id="legacyNotice" class="notice">Use HTTP PageMethods save to avoid socket/WebSocket issues on XP/Vista.</div>
<asp:Literal runat="server" ID="litStatus" />
</div>
</asp:Content>
<script runat="server">
[WebMethod]
public static string SaveChannel(string name, string description, string streamUrl, string sourceType, bool isLive)
{
  if (string.IsNullOrEmpty(name)) return "Name required";
  int id = MeTVeRepository.SaveChannel(name, description, streamUrl, sourceType, isLive);
  return "OK:" + id;
}
</script>
<script type="text/javascript">
function saveChannelAjax() {
  var name = document.getElementById('<%= txtName.ClientID %>').value;
  var description = document.getElementById('<%= txtDescription.ClientID %>').value;
  var stream = document.getElementById('<%= txtStream.ClientID %>').value;
  var sourceType = document.getElementById('<%= ddlSource.ClientID %>').value;
  var isLive = document.getElementById('<%= chkLive.ClientID %>').checked;

  PageMethods.SaveChannel(name, description, stream, sourceType, isLive, function (res) {
    meTVe.notify('Channel saved: ' + res);
  }, function (err) {
    meTVe.notify('Save failed: ' + err.get_message());
  });
  return false;
}
</script>
