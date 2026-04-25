<%@ Page Title="Media Library" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
<div class="panel"><h2>Media Library</h2>
<p>Folders: Shows, Movies, Adverts, Bumpers, Bumper Breaks, Commercials, Songs, Idents, Promos, Audio/Music, Sounds, Games, SMS Data, Archive Content, Video Sharing, Images, Templates, Flash Content.</p>
<label>Upload Simulation</label>
<asp:FileUpload runat="server" ID="fuAsset" />
<asp:Button runat="server" Text="Ingest Asset" CssClass="btn" />
<p class="small">Chunked/resume upload is expected through an HTTP handler in production deployment.</p>
</div>
</asp:Content>
