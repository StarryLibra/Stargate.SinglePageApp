USE Stargate;

-- Serilog.Sinks.MSSqlServer (https://github.com/serilog-mssql/serilog-sinks-mssqlserver)
CREATE TABLE dbo.[SerilogLogs] (
  [Id] int IDENTITY(1,1) NOT NULL,
  [Message] nvarchar(max) NULL,
  [MessageTemplate] nvarchar(max) NULL,
  [Level] nvarchar(128) NULL,
  [TimeStamp] datetimeoffset(7) NOT NULL,  -- use datetime for SQL Server pre-2008
  [Exception] nvarchar(max) NULL,
  [Properties] xml NULL,
  [LogEvent] nvarchar(max) NULL
  CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED ([Id] ASC);
GO;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An optional table identity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'Id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formatted output', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'Message';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The log event message with the property placeholders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'MessageTemplate';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The event level', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'Level';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time the log event was sent to Serilog', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'TimeStamp';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The exception message if an exception is logged as part of the log event', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'Exception';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Log event property values as XML', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'Properties';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Log event property values as JSON', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SerilogLogs', @level2type=N'COLUMN', @level2name=N'LogEvent';
GO;

CREATE TABLE dbo.[SysDictionaryMain] (
  [Id] smallint IDENTITY(1,1) NOT NULL,
  [Entry] nvarchar(25) NOT NULL,
  [Description] nvarchar(max) NULL
  CONSTRAINT [PK_SysDictionaryMain] PRIMARY KEY CLUSTERED
  (
    [Id] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一标识值', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryMain', @level2type=N'COLUMN', @level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'词条', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryMain', @level2type=N'COLUMN', @level2name=N'Entry'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryMain', @level2type=N'COLUMN', @level2name=N'Description'
GO;

CREATE TABLE dbo.[SysDictionaryItem] (
  [EntryId] smallint NOT NULL,
  [ItemName] nvarchar(50) NOT NULL,
  [ItemSeq] int NOT NULL,
  [Description] nvarchar(max) NULL,
  [Disabled] bit NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO;
ALTER TABLE dbo.[SysDictionaryItem] ADD CONSTRAINT [DF_SysDictionaryItem_ItemSeq] DEFAULT (0) FOR [ItemSeq];
ALTER TABLE dbo.[SysDictionaryItem] ADD CONSTRAINT [DF_SysDictionaryItem_Disabled] DEFAULT (0) FOR [Disabled];
GO;
CREATE UNIQUE NONCLUSTERED INDEX [IX_SysDictionaryItem] ON dbo.[SysDictionaryItem]
(
  [EntryId] ASC,
  [ItemName] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一标识值', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryItem', @level2type=N'COLUMN', @level2name=N'Id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'词条标识值', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryItem', @level2type=N'COLUMN', @level2name=N'EntryId';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事项名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryItem', @level2type=N'COLUMN', @level2name=N'ItemName';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事项序号', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryItem', @level2type=N'COLUMN', @level2name=N'ItemSeq';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryItem', @level2type=N'COLUMN', @level2name=N'Description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysDictionaryItem', @level2type=N'COLUMN', @level2name=N'Disabled';
GO;

CREATE TABLE dbo.[SysSettingKV](
  [Key] nvarchar(50) NOT NULL,
  [Value] nvarchar(50) NOT NULL,
  [Memo] nvarchar(max) NULL,
  CONSTRAINT [PK_SysSettingKV] PRIMARY KEY CLUSTERED
  (
    [Key] ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO;
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键名', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysSettingKV', @level2type=N'COLUMN', @level2name=N'Key';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键值', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysSettingKV', @level2type=N'COLUMN', @level2name=N'Value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'SysSettingKV', @level2type=N'COLUMN', @level2name=N'Memo';
GO;
