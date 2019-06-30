USE [geometrikit]
GO



--EXEC [UDP_GET_GROUPS] 1


CREATE PROCEDURE [dbo].[UDP_GET_GROUPS] @userID INT
AS 


DECLARE @schoolID as INT
SELECT @schoolID =U.schoolID
FROM Users U
WHERE U.UserID = @userID

 
 
IF OBJECT_ID('tempdb..#TEMP_FOR') IS NOT NULL
DROP TABLE #TEMP_FOR
SELECT G.groupID, G.teacherID, G.questionnaire, G.grade, U.firstName, S.[studentRating], assigned = 'false'
INTO #TEMP_FOR
FROM (SELECT * FROM [dbo].[Groups] WHERE schoolID= @schoolID) G
INNER JOIN Users U
ON U.userID =G.teacherID
FULL OUTER JOIN (SELECT * FROM [dbo].[Students] WHERE [userID] = @UserID) S
ON S.groupID = G.groupID

UPDATE #TEMP_FOR
SET assigned = 'true'
WHERE studentRating=studentRating

SELECT *
FROM #TEMP_FOR