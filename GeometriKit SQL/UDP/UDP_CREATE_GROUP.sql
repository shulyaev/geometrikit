USE [geometrikit]
GO



--EXEC [UDP_CREATE_GROUP] 10,3,'ח'


CREATE PROCEDURE [dbo].[UDP_CREATE_GROUP] @teacherID INT, @questionnaire INT, @grade NVARCHAR(50)
AS 
 
DECLARE @schoolID as int
SELECT @schoolID = U.schoolID
FROM Users U
WHERE U.userID = @teacherID

INSERT INTO [dbo].[Groups](teacherID, questionnaire, grade, schoolID)
VALUES (@teacherID, @questionnaire, @grade, @schoolID)

