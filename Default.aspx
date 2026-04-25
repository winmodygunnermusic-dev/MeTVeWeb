<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Featured Channels</h2>
        <asp:Repeater ID="rptChannels" runat="server">
            <ItemTemplate>
                <div>
                    <a href='Watch.aspx?id=<%# Eval("Id") %>'><%# Eval("Name") %></a>
                    <span class="small">(<%# Eval("SourceType") %>)</span>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
