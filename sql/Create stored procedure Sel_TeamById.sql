USE Basics
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<David Cruz González>
-- Create date: <Marets 30 de Mayo del 2017>
-- Description:	<Buscar usuario por id>
-- =============================================

CREATE PROCEDURE Sel_TeamById

@id as int

AS
BEGIN

SELECT * FROM [dbo].[teams] WHERE [idTeam] = @id

END
GO