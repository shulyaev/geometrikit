USE [geometrikit]
GO



--EXEC [UDP_CREATE_GROUP] 10,3,'ח'


CREATE PROCEDURE [dbo].[UDP_UPDATE_ASSIGN_TO_GROUP] @studentID INT, @groupID INT
AS 
 

INSERT INTO [dbo].[Students](userID, groupID, classID, studentRating)
VALUES (@studentID, @groupID,1,5)

