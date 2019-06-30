/****** Script for SelectTopNRows command from SSMS  ******/
use geometrikit
--EXEC UDP_GET_USER_DETAILS @username = 'username', @passwordD = 'password'
go



ALTER PROCEDURE UDP_GET_USER_DETAILS @username as nvarchar(30), @passwordD as nvarchar(30)
AS

SELECT		U.userID,
			U.firstName,
			U.lastName,
			U.userName,
			U.permissionID,
			U.schoolID,
			U.profilePicture,
			P.permissionName,
			SC.schoolName,
			S.groupID,
			S.classID,
			S.studentRating
		
FROM (SELECT * FROM Users WHERE username = @username AND password = @passwordD) AS U 
INNER JOIN Permissions AS P
ON U.permissionID = P.permissionID
INNER JOIN School AS SC
ON U.schoolID = SC.schoolID
INNER JOIN Students as S
ON U.userID =S.userID
--INNER JOIN [dbo].[QuestionsAndClasses] AS QC
--ON S.classID = QC.classID
--INNER JOIN [dbo].[Questions] AS Q
--ON Q.questionID = QC.questionID
--INNER JOIN Hints as H
--ON Q.questionID = H.questionID
