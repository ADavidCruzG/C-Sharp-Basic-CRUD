USE Basics
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<David Cruz González>
-- Create date: <Lunes 29 de Mayo del 2017>
-- Description:	<Actualizar usuario>
-- =============================================

CREATE PROCEDURE Upd_TeamUpdate

@name as nvarchar(50),
@foundationYear as int,
@nickname as nvarchar(50),
@stadiumName as nvarchar(50),
@id as int

AS
BEGIN

UPDATE [dbo].[teams]
SET [name] = @name
   ,[foundationYear] = @foundationYear
   ,[nickname] = @nickname
   ,[stadiumName] = @stadiumName
WHERE [idTeam] = @id

END
GO