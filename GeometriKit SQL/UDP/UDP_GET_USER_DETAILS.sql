/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
FROM (Users
INNER JOIN Permissions 
ON Users.permissionID = Permissions.permissionID)
INNER JOIN School
ON Users.schoolID = School.schoolID
INNER JOIN Students as S
ON Users.userID =S.userID
INNER JOIN [dbo].[QuestionsAndClasses] AS QC
ON S.classID = QC.classID
INNER JOIN [dbo].[Questions] AS Q
ON Q.questionID = QC.questionID

