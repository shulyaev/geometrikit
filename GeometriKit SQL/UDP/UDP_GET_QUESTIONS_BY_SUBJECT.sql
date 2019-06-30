/****** Script for SelectTopNRows command from SSMS  ******/
use geometrikit
--EXEC UDP_GET_QUESTIONS_BY_SUBJECT @subjectID = 1,@groupID = 1
go



ALTER PROCEDURE UDP_GET_QUESTIONS_BY_SUBJECT @subjectID as INT, @groupID INT
AS

SELECT  Q.[questionID]
      , Q.[bookName]
      , Q.[page]
      , Q.[questionNumber]
      , Q.[authorID]
      , Q.[content]
      , Q.[picture]
      , Q.[rank]
      , S.[color]  
  FROM [dbo].[Questions] Q INNER JOIN [dbo].[QuestionsAndClasses] QC
  ON  Q.[questionID] = QC.[questionID]
  INNER JOIN [dbo].[Subjects] S ON S.subjectID = @subjectID
  WHERE Q.[subjectID] =@SubjectID and QC.[classID] = @GroupID
