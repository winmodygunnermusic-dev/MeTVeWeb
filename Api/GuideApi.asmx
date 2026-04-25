<%@ WebService Language="C#" Class="GuideApi" %>
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Xml;

[WebService(Namespace = "http://metve.tv/")]
public class GuideApi : WebService
{
    [WebMethod]
    public string ExportJson()
    {
        List<ProgramItem> data = MeTVeRepository.GetProgramsWindow(DateTime.UtcNow.Date, DateTime.UtcNow.Date.AddDays(1));
        return new JavaScriptSerializer().Serialize(data);
    }

    [WebMethod]
    public string ExportXmlTv()
    {
        List<ProgramItem> data = MeTVeRepository.GetProgramsWindow(DateTime.UtcNow.Date, DateTime.UtcNow.Date.AddDays(1));
        StringBuilder sb = new StringBuilder();
        using (XmlWriter xw = XmlWriter.Create(sb))
        {
            xw.WriteStartElement("tv");
            foreach (ProgramItem p in data)
            {
                xw.WriteStartElement("programme");
                xw.WriteAttributeString("start", p.StartTime.ToString("yyyyMMddHHmmss"));
                xw.WriteAttributeString("stop", p.EndTime.ToString("yyyyMMddHHmmss"));
                xw.WriteAttributeString("channel", p.ChannelName);
                xw.WriteElementString("title", p.Title);
                xw.WriteElementString("desc", p.Description ?? string.Empty);
                xw.WriteElementString("category", p.Category ?? string.Empty);
                xw.WriteEndElement();
            }
            xw.WriteEndElement();
            xw.Flush();
        }
        return sb.ToString();
    }
}
