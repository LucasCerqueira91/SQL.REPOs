USE [Scheduler]
GO


SELECT [ID]
      ,[ONsite_Class]
      ,[Remote_Class]
      ,[DateTime_Classes]
      ,[FK_TeacherID]
      ,[FK_SubjectID]
  FROM [dbo].[Booked_Classes]


  SELECT * FROM Booked_Classes

INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           (<ONsite_Class, varchar(70),>
           ,<Remote_Class, varchar(100),>
           ,<DateTime_Classes, datetime,>
           ,<FK_TeacherID, int,>
           ,<FK_SubjectID, int,>)


UPDATE [dbo].[Booked_Classes]
   SET [ONsite_Class] = <ONsite_Class, varchar(70),>
      ,[Remote_Class] = <Remote_Class, varchar(100),>
      ,[DateTime_Classes] = <DateTime_Classes, datetime,>
      ,[FK_TeacherID] = <FK_TeacherID, int,>
      ,[FK_SubjectID] = <FK_SubjectID, int,>
 WHERE <Search Conditions,,>

 
DELETE FROM [dbo].[Booked_Classes]
      WHERE <Search Conditions,,>
GO
