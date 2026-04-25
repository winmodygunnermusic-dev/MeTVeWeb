# MeTVe Nostalgia – Online Television Platform (Web Forms Starter)

This repository now contains a Web Forms starter implementation aligned to the requested legacy + live streaming architecture.

## Implemented foundation

- Public pages:
  - `Default.aspx`, `Channels.aspx`, `Watch.aspx`, `TVGuide.aspx`
  - `Login.aspx`, `Register.aspx`, `Profile.aspx`, `Advertise.aspx`
- Admin/CMS pages:
  - `Admin/Dashboard.aspx`, `Admin/Channels.aspx`, `Admin/Scheduler.aspx`, `Admin/MediaLibrary.aspx`, `Admin/SMS.aspx`, `Admin/Analytics.aspx`
- Synchronous channel save API (no socket dependency):
  - `Services/ChannelService.asmx` + `App_Code/ChannelService.cs`
- SQL schema starter:
  - `App_Data/schema.sql`
- Nostalgia style mode:
  - `Content/site.css`

## Compatibility notes

- Uses ASP.NET Web Forms primitives, Forms Authentication, Membership and Roles in `Web.config`.
- Avoids WebSocket requirement; channel creation persists over HTTP/ASMX + SQL.
- Includes HTML5 `<video>` player plus Windows Media Player object fallback on watch page.
- `pages controlRenderingCompatibilityVersion="3.5"` set for legacy rendering behavior.

## Next build steps

1. Wire ASP.NET providers to a production SQL Server database.
2. Add upload handler with chunked upload and optional FFmpeg transcoding pipeline.
3. Build scheduler editor UI and server-side conflict detector.
4. Implement SMS ingestion endpoint + moderation workflow + ticker output serialization.
5. Add XML/JSON EPG export endpoints.
