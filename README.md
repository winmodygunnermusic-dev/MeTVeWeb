# MeTVe – Social Online Television (Legacy + Live Stream Edition)

MeTVe is a virtual cable-style online TV platform built with ASP.NET Web Forms for legacy compatibility and modern browser reach.

## Implemented foundation
- Public site modules: featured/live homepage, channel directory with search, watch player, TV guide, profiles, ads page.
- Control panel modules: channel builder, scheduler, media library, SMS/chat moderation, analytics.
- Streaming support baseline: HLS (`.m3u8`), HTTP/RTMP URL fields, WMP legacy fallback player.
- Legacy-safe API design: HTTP WebMethods + ASMX endpoints; WebSockets disabled intentionally.
- Scheduler/EPG baseline: daily/weekly views + JSON/XMLTV export endpoint.
- Social layer placeholders: SMS/chat queue and voting hooks for overlay integration.
- Monetization baseline: ad campaign schema and analytics dashboard scaffolding.

## Legacy compatibility notes
- Web Forms `.aspx` architecture (no SPA framework required).
- Script layer sticks to ES3/ES5-compatible patterns.
- Polling model used for real-time behavior instead of sockets.
- WMP object fallback preserved for XP/Vista-era browsers.

## Setup
1. Create SQL database from `App_Data/schema.sql` on SQL Server 2008+.
2. Configure `MeTVeDb` in `Web.config`.
3. Run `aspnet_regsql.exe` for Membership/Roles tables.
4. Publish to IIS with ASP.NET v4 app pool.
