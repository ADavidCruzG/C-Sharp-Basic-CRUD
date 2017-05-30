USE Basics
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<David Cruz González>
-- Create date: <Lunes 29 de Mayo del 2017>
-- Description:	<Crear equipo>
-- =============================================

CREATE PROCEDURE Cre_TeamCreate

@name as nvarchar(50),
@foundationYear as int,
@nickname as nvarchar(50),
@stadiumName as nvarchar(50)

AS
BEGIN

INSERT INTO teams (name, foundationYear, nickname, stadiumName)
VALUES (@name, @foundationYear, @nickname, @stadiumName)

END
GO