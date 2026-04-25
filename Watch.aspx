<%@ Page Title="Watch" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Watch.aspx.cs" Inherits="Watch" %>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2><asp:Literal ID="litChannel" runat="server" /></h2>
        <video id="livePlayer" controls autoplay width="640" height="480" runat="server"></video>
        <div class="small">Legacy fallback:</div>
        <object width="640" height="480" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
            <param name="URL" value="<%= StreamUrl %>" />
        </object>
    </div>
</asp:Content>
