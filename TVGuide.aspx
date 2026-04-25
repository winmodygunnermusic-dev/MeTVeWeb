<%@ Page Title="TV Guide" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>EPG Grid</h2>
<asp:GridView runat="server" ID="gvGuide" CssClass="grid" AutoGenerateColumns="false">
<Columns>
<asp:BoundField DataField="ChannelName" HeaderText="Channel" />
<asp:BoundField DataField="Title" HeaderText="Program" />
<asp:BoundField DataField="StartTime" HeaderText="Start" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
<asp:BoundField DataField="EndTime" HeaderText="End" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
</Columns>
</asp:GridView></div>
</asp:Content>
<script runat="server">
protected void Page_Load(object sender, EventArgs e){
 if(!IsPostBack){ gvGuide.DataSource = MeTVeRepository.GetPrograms(); gvGuide.DataBind(); }
}
</script>
