

CREATE PROCEDURE [dbo].[UDP_UPDATE_USER_STATISTICS]	@userID AS INT, @questionID AS INT, @hintID AS INT, @success AS INT, @used AS INT, @time AS INT
AS				
INSERT INTO 	[dbo].[STATISTICS](	userID, questionID, hintID, success, used, time)
VALUES (@userID, @questionID, @hintID, @success, @used, @time)		
