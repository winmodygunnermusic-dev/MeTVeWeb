<%@ Page Title="Channels" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Channels.aspx.cs" Inherits="Channels" %>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Channel Directory</h2>
        <asp:GridView ID="gvChannels" runat="server" CssClass="grid" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:TemplateField HeaderText="Channel">
                    <ItemTemplate>
                        <a href='Watch.aspx?id=<%# Eval("Id") %>'><%# Eval("Name") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SourceType" HeaderText="Source" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
