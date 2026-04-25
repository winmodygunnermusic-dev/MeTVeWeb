# MeTVe Nostalgia (Legacy + Live Stream Edition)

ASP.NET Web Forms scaffold for a cloud-hosted nostalgia TV platform with live streaming, scheduling, and CMS workflows.

## Included modules
- Public pages: home, channels, watch, TV guide, login/register/profile, advertise.
- Admin pages: dashboard, channels, scheduler, media library, SMS moderation, analytics.
- Legacy-safe channel save API via HTTP (`Admin/Channels.aspx` WebMethod and `Api/ChannelApi.asmx`).
- SQL schema for channels, EPG programs, and SMS moderation queue.
- Nostalgia style shell with simple classic gradients and glow accents.

## Run notes
1. Create SQL database using `App_Data/schema.sql`.
2. Update `MeTVeDb` connection string in `Web.config` for IIS/SQL Server.
3. Enable ASP.NET membership/roles tables (`aspnet_regsql.exe`) for authentication.
4. Publish to IIS with .NET Framework v4 app pool.
