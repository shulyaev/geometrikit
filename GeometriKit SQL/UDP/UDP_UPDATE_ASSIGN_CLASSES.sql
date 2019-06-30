/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[UDP_UPDATE_ASSIGN_CLASSES] @classID AS INT , @questionID AS INT , @assigned AS NVARCHAR(200)
--EXEC UDP_UPDATE_ASSIGN_CLASSES 1,1,'false'
AS

IF @assigned = 'true'
	BEGIN
		INSERT INTO [dbo].[QuestionsAndClasses](classID, questionID)
		VALUES (@classID, @questionID)
	END
ELSE
	BEGIN
		DELETE FROM [dbo].[QuestionsAndClasses]
		WHERE classID = @classID AND questionID = @questionID
	END
