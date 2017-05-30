USE [Basics]
GO

/****** Object:  StoredProcedure [dbo].[Sel_TeamAll]    Script Date: 29/05/2017 14:14:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<David Cruz González>
-- Create date: <Lunes 29 de Mayo del 2017>
-- Description:	<Busca todos los equipos>
-- =============================================

CREATE PROCEDURE [dbo].[Sel_TeamAll]

AS
BEGIN

	SELECT * FROM [dbo].[teams]
END

GO