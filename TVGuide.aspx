<%@ Page Title="TV Guide" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TVGuide.aspx.cs" Inherits="TVGuide" %>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>EPG Grid</h2>
        <asp:GridView ID="gvGuide" runat="server" CssClass="grid" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="ChannelId" HeaderText="Channel" />
                <asp:BoundField DataField="Title" HeaderText="Program" />
                <asp:BoundField DataField="StartTime" HeaderText="Start" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                <asp:BoundField DataField="EndTime" HeaderText="End" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
