USE Basics
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<David Cruz González>
-- Create date: <Lunes 29 de Mayo del 2017>
-- Description:	<Eliminar usuario>
-- =============================================

CREATE PROCEDURE Del_TeamDelete

@id as int

AS
BEGIN

DELETE FROM [dbo].[teams]
WHERE [idTeam] = @id

END
GO