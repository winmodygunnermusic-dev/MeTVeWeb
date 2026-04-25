using System;

public class Channel
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string StreamUrl { get; set; }
    public string SourceType { get; set; }
    public bool IsNostalgiaMode { get; set; }
}

public class ProgramSlot
{
    public int Id { get; set; }
    public int ChannelId { get; set; }
    public string Title { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }
    public int MediaId { get; set; }
}
