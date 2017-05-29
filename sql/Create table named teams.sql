USE [Basics]
GO

/****** Object:  Table [dbo].[teams]    Script Date: 29/05/2017 10:29:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[teams](
	[idTeam] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[foundationYear] [int] NOT NULL,
	[nickname] [nvarchar](50) NOT NULL,
	[stadiumName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO


