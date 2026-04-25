<%@ Page Title="Admin Channels" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.Services" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Channel Manager</h2>
<label>Name</label><asp:TextBox runat="server" ID="txtName" />
<label>Description</label><asp:TextBox runat="server" ID="txtDescription" />
<label>Stream URL (.m3u8 / RTMP)</label><asp:TextBox runat="server" ID="txtStream" />
<br /><br /><asp:Button runat="server" Text="Save Channel" CssClass="btn" OnClick="SaveChannel" />
<asp:Literal runat="server" ID="litStatus" />
</div>
</asp:Content>
<script runat="server">
protected void SaveChannel(object sender, EventArgs e){
  litStatus.Text = CreateChannel(txtName.Text, txtDescription.Text, txtStream.Text);
}
[WebMethod]
public static string CreateChannel(string name, string description, string streamUrl)
{
  using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MeTVeDb"].ConnectionString))
  {
    conn.Open();
    SqlCommand cmd = new SqlCommand("INSERT INTO Channels (Name, Description, StreamUrl, SourceType) VALUES (@name,@description,@streamUrl,'Live')", conn);
    cmd.Parameters.AddWithValue("@name", name);
    cmd.Parameters.AddWithValue("@description", description);
    cmd.Parameters.AddWithValue("@streamUrl", streamUrl);
    cmd.ExecuteNonQuery();
  }
  return "OK";
}
</script>
