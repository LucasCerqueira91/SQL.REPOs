/*
This is a two-part exercise, on which each group member will receive part of the required tasks
to fully complete. On this part the main needs and requirements as specified to help both
parts get a main view on the task at hand.
Work together to get to the complete all the required tasks. Remember that you can help your
partner with his work at any time and it recommended.
Base information:
You must create and application and structure database that allows a user to:
• Create teacher and students;
• Create classes;
• Book classes for student;
• Consult the current booked classed;
• Create classes;
• Assign teacher to classes;
It will be requested to the student to present the developed work, either fully or partially, to
the class. This will be done preferably in English.

Develop an SQL query script for each of the points below.
This is a two-part exercise, on which the second part is provided to a group member. Work
together to get to the complete all the required tasks. Remember that you can help your
partner with his work at any time and it recommended.
Tasks:
1. Considering a schedule required structure, design the database and create with the name
“Scheduler”;
2. Create all the required table for the structure;
3. Add data to all the tables;
4. Create the script that allow data INSERT, when required;
5. Create the script that allow data UPDATE, when required;
6. Create the script that allow data SELECT, when required;
7. Create the script that allow data DELETE, when required;

*/
-- MODELING DATABASE
USE Scheduler
USE Vehicles
CREATE DATABASE Scheduler

DROP DATABASE Scheduler

DROP TABLE  Student
DROP TABLE  Student_Booked_Classes
DROP TABLE  Classes_Teacher_Subject
DROP TABLE Teacher, Subjects; 

CREATE TABLE Student (
ID INT PRIMARY KEY IDENTITY,
Student_Name VARCHAR (100) NOT NULL,
Email_Student VARCHAR(100) NOT NULL,
NIF_Student INT NOT NULL,
Adress_Student Varchar (100) NOT NULL,
Student_Phone INT NOT NULL);

CREATE TABLE Classes_Teacher_Subject (
ID INT PRIMARY KEY IDENTITY,
FK_SubjectID INT NOT NULL,
FK_TeacherID INT NOT NULL,
);

CREATE TABLE Booked_Classes (
	 ID INT IDENTITY(1,1) NOT NULL,
	 ONsite_Class VARCHAR(70) NOT NULL,
	 Remote_Class VARCHAR(100) NOT NULL,
	 DateTime_Classes DATETIME NOT NULL,
	 FK_TeacherID INT NOT NULL,
	 FK_SubjectID INT NOT NULL);
	 
CREATE TABLE Student_Booked_Classes (
ID INT IDENTITY(1,1) NOT NULL,
FK_StudentID INT NOT NULL,
FK_Booked_Classes INT NOT NULL);

CREATE TABLE Teacher (
ID INT IDENTITY,
Name_Teacher VARCHAR (100) NOT NULL,
Email_Teacher VARCHAR(100) NOT NULL,
NIF_Teacher INT NOT NULL,
Adress_Teacher Varchar (100) NOT NULL,
Phone_Teacher INT NOT NULL);

CREATE TABLE Subjects (
ID INT PRIMARY KEY IDENTITY,
Name_Subject VARCHAR (100) NOT NULL,
Subject_Level INT NOT NULL);

EXEC sp_columns Student;  

SELECT * FROM Student 

ALTER TABLE Booked_Classes ADD PRIMARY KEY (ID);

ALTER TABLE Classes 
ADD FK_TeacherID INT NOT NULL, 
FK_StudentID INT NOT NULL, 
FK_SubjectID INT NOT NULL;

ALTER TABLE Classes_Teacher_Subject 
ADD CONSTRAINT Classes_Teacher_Subject_FK_SubjectID  UNIQUE (FK_SubjectID) , 
CONSTRAINT Classes_Teacher_Subject_FK_TeacherID UNIQUE (FK_TeacherID);

ALTER TABLE Student_Booked_Classes 
ADD CONSTRAINT Student_Booked_Classes_FK_StudentID  UNIQUE (FK_StudentID) ,
CONSTRAINT Student_Booked_Classes_FK_Classes_Teacher_SubjectID 
UNIQUE (FK_Classes_Teacher_SubjectID);

ALTER TABLE Booked_Classes
ADD FOREIGN KEY (FK_TeacherID) REFERENCES Teacher(ID);

ALTER TABLE Student_Booked_Classes
ADD FOREIGN KEY (FK_StudentID) REFERENCES Student(ID);

ALTER TABLE Student_Booked_Classes
ADD FOREIGN KEY (FK_Booked_Classes) REFERENCES Booked_Classes(ID);

ALTER TABLE Booked_Classes ADD CONSTRAINT FK_TeacherID
FOREIGN KEY (FK_TeacherID) REFERENCES Teacher(ID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Teacher ADD CONSTRAINT FK_Teacher_BookedClasses
FOREIGN KEY (FK_TeacherID) REFERENCES Teacher(ID);

ADD CONSTRAINT Student_Booked_Classes_FK_StudentID  UNIQUE (FK_StudentID) ,
CONSTRAINT Student_Booked_Classes_FK_Classes_Teacher_SubjectID 
UNIQUE (FK_Classes_Teacher_SubjectID);

ALTER TABLE Teacher
ADD CONSTRAINT UC_Email_T UNIQUE (Email_Teacher) , CONSTRAINT UC_NIF_T UNIQUE (NIF_Teacher);


ALTER TABLE Teacher 
ADD Name_Teacher VARCHAR (50) NOT NULL;
Email_Teacher VARCHAR (100) NOT NULL,
NIF_Teacher INT NOT NULL;

ALTER TABLE Teacher 
DROP COLUMN Teacher_Name


ALTER TABLE Student 
DROP COLUMN Class_ID;





	CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED ([Id] ASC)
);
 CREATE TABLE Subject_Name (
  ID INT PRIMARY KEY IDENTITY (1,1),
  Name_Subject VARCHAR(40) NOT NULL,
  ID_Class INT NOT NULL
);

CREATE TABLE Classes (
ID INT PRIMARY KEY IDENTITY(1,1),
DataTime_Class DATETIME NOT NULL,
Teacher_ID INT NOT NULL,
Student_ID INT NOT NULL,
Subject_ID INT NOT NULL);USE Scheduler
USE Vehicles
CREATE DATABASE Scheduler

DROP DATABASE Scheduler

DROP TABLE  Student
DROP TABLE  Student_Booked_Classes
DROP TABLE  Classes_Teacher_Subject
DROP TABLE Teacher, Subjects; 

CREATE TABLE Student (
ID INT PRIMARY KEY IDENTITY,
Student_Name VARCHAR (100) NOT NULL,
Email_Student VARCHAR(100) NOT NULL,
NIF_Student INT NOT NULL,
Adress_Student Varchar (100) NOT NULL,
Student_Phone INT NOT NULL);

CREATE TABLE Classes_Teacher_Subject (
ID INT PRIMARY KEY IDENTITY,
FK_SubjectID INT NOT NULL,
FK_TeacherID INT NOT NULL,
);

CREATE TABLE Booked_Classes (
	 ID INT IDENTITY(1,1) NOT NULL,
	 ONsite_Class VARCHAR(70) NOT NULL,
	 Remote_Class VARCHAR(100) NOT NULL,
	 DateTime_Classes DATETIME NOT NULL,
	 FK_TeacherID INT NOT NULL,
	 FK_SubjectID INT NOT NULL);
	 
CREATE TABLE Student_Booked_Classes (
ID INT IDENTITY(1,1) NOT NULL,
FK_StudentID INT NOT NULL,
FK_Booked_Classes INT NOT NULL);

CREATE TABLE Teacher (
ID INT IDENTITY,
Name_Teacher VARCHAR (100) NOT NULL,
Email_Teacher VARCHAR(100) NOT NULL,
NIF_Teacher INT NOT NULL,
Adress_Teacher Varchar (100) NOT NULL,
Phone_Teacher INT NOT NULL);

CREATE TABLE Subjects (
ID INT PRIMARY KEY IDENTITY,
Name_Subject VARCHAR (100) NOT NULL,
Subject_Level INT NOT NULL);

EXEC sp_columns Student;  

SELECT * FROM Student 

ALTER TABLE Booked_Classes ADD PRIMARY KEY (ID);

ALTER TABLE Classes 
ADD FK_TeacherID INT NOT NULL, 
FK_StudentID INT NOT NULL, 
FK_SubjectID INT NOT NULL;

ALTER TABLE Classes_Teacher_Subject 
ADD CONSTRAINT Classes_Teacher_Subject_FK_SubjectID  UNIQUE (FK_SubjectID) , 
CONSTRAINT Classes_Teacher_Subject_FK_TeacherID UNIQUE (FK_TeacherID);

ALTER TABLE Student_Booked_Classes 
ADD CONSTRAINT Student_Booked_Classes_FK_StudentID  UNIQUE (FK_StudentID) ,
CONSTRAINT Student_Booked_Classes_FK_Classes_Teacher_SubjectID 
UNIQUE (FK_Classes_Teacher_SubjectID);

ALTER TABLE Booked_Classes
ADD FOREIGN KEY (FK_TeacherID) REFERENCES Teacher(ID);

ALTER TABLE Student_Booked_Classes
ADD FOREIGN KEY (FK_StudentID) REFERENCES Student(ID);

ALTER TABLE Student_Booked_Classes
ADD FOREIGN KEY (FK_Booked_Classes) REFERENCES Booked_Classes(ID);

ALTER TABLE Booked_Classes ADD CONSTRAINT FK_TeacherID
FOREIGN KEY (FK_TeacherID) REFERENCES Teacher(ID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Teacher ADD CONSTRAINT FK_Teacher_BookedClasses
FOREIGN KEY (FK_TeacherID) REFERENCES Teacher(ID);

ADD CONSTRAINT Student_Booked_Classes_FK_StudentID  UNIQUE (FK_StudentID) ,
CONSTRAINT Student_Booked_Classes_FK_Classes_Teacher_SubjectID 
UNIQUE (FK_Classes_Teacher_SubjectID);

ALTER TABLE Teacher
ADD CONSTRAINT UC_Email_T UNIQUE (Email_Teacher) , CONSTRAINT UC_NIF_T UNIQUE (NIF_Teacher);


ALTER TABLE Teacher 
ADD Name_Teacher VARCHAR (50) NOT NULL;
Email_Teacher VARCHAR (100) NOT NULL,
NIF_Teacher INT NOT NULL;

ALTER TABLE Teacher 
DROP COLUMN Teacher_Name


ALTER TABLE Student 
DROP COLUMN Class_ID;


--INSERT DATA IN DATABASE
USE [Scheduler]
GO

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
GO


SELECT * FROM Teacher;
SELECT * FROM Subjects


USE [Scheduler]
GO

INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 10:45:00'
           ,3
           ,1)

		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('SIM'
           ,'NÃO'
           ,'2023-01-20 10:45:00'
           ,5
           ,3)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 10:45:00'
           ,6
           ,2)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('SIM'
           ,'NÃO'
           ,'2023-01-20 10:45:00'
           ,7
           ,3)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 10:45:00'
           ,8
           ,3)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('SIM'
           ,'NÃO'
           ,'2023-01-20 11:45:00'
           ,1
           ,4)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 11:45:00'
           ,3
           ,4)
GO
INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('SIM'
           ,'NÃO'
           ,'2023-01-20 11:45:00'
           ,5
           ,5)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 11:45:00'
           ,6
           ,5)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('SIM'
           ,'NÃO'
           ,'2023-01-20 11:45:00'
           ,7
           ,6)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 11:45:00'
           ,8
           ,6)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('SIM'
           ,'NÃO'
           ,'2023-01-20 11:45:00'
           ,1
           ,7)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 11:45:00'
           ,3
           ,7)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('SIM'
           ,'NÃO'
           ,'2023-01-20 11:45:00'
           ,5
           ,8)
		   INSERT INTO [dbo].[Booked_Classes]
           ([ONsite_Class]
           ,[Remote_Class]
           ,[DateTime_Classes]
           ,[FK_TeacherID]
           ,[FK_SubjectID])
     VALUES
           ('NÃO'
           ,'SIM'
           ,'2023-01-20 11:45:00'
           ,6
           ,8)
SELECT * FROM Booked_Classes
SELECT * FROM Teacher
SELECT * FROM Subjects
SELECT * FROM Student
SELECT * FROM Student_Booked_Classes




--EXEMPLE FOR HELP
ORDER BY ASCI
/*One-To-One*/
CREATE TABLE [dbo].[Contatos] (
	[Id] INT IDENTITY(1,1) NOT NULL,
	[UsuarioId] INT NOT NULL,
	[Telefone] VARCHAR(15) NULL,
	[Celular] VARCHAR(15) NULL,

	CONSTRAINT [PK_Contatos] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Contatos_Usuarios] FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE CASCADE
);

/*One-To-Many*/
CREATE TABLE [dbo].[EnderecosEntrega] (
	[Id] INT IDENTITY(1,1) NOT NULL,
	[UsuarioId] INT NOT NULL,
	[NomeEndereco] VARCHAR(100) NOT NULL,
	[CEP] CHAR(10) NOT NULL,
	[Estado] CHAR(2) NOT NULL,
	[Cidade] VARCHAR(120) NOT NULL,
	[Bairro] VARCHAR(200) NOT NULL,
	[Endereco] VARCHAR(200) NOT NULL,
	[Numero] VARCHAR(20) NULL,
	[Complemento] VARCHAR(30) NULL,
	
	CONSTRAINT [PK_EnderecosEntrega] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_EnderecosEntrega_Usuarios] FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE CASCADE

);

/*Many-To-Many*/
CREATE TABLE [dbo].[Departamentos] (
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Nome] VARCHAR(100) NOT NULL,
	CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED ([Id] ASC),
);

CREATE TABLE [dbo].[UsuariosDepartamentos] (
	[Id] INT IDENTITY(1,1) NOT NULL,
	[UsuarioId] INT NOT NULL,
	[DepartamentoId] INT NOT NULL,

	CONSTRAINT [PK_UsuariosDepartamentos] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_UsuariosDepartamentos_Usuarios] FOREIGN KEY ([UsuarioId]) REFERENCES [dbo].[Usuarios] ([Id]) ON DELETE CASCADE,
	CONSTRAINT [FK_UsuariosDepartamentos_Departamentos] FOREIGN KEY ([DepartamentoId]) REFERENCES [dbo].[Departamentos] ([Id]) ON DELETE CASCADE
);
go


-- Store Procedures na tabela de Usuarios
CREATE PROCEDURE dbo.SelecionarUsuarios
AS
    SELECT * FROM [dbo].[Usuarios]
go

CREATE PROCEDURE dbo.SelecionarUsuario
(
	@id int
)
AS
    SELECT * FROM [dbo].[Usuarios] WHERE Id = @id
go

CREATE PROCEDURE dbo.CadastrarUsuario
(
	@nome varchar(70),
	@email varchar(100),
	@sexo char(1),
	@rg varchar(15),
	@cpf char(14),
	@nomeMae varchar(70),
	@situacaoCadastro char(1),
	@dataCadastro datetimeoffset
)
AS
	INSERT INTO [dbo].[Usuarios] (Nome, Email, Sexo, RG, CPF, NomeMae, SituacaoCadastro, DataCadastro) VALUES
	(@nome, @email, @sexo, @rg, @cpf, @nomeMae, @situacaoCadastro, @dataCadastro); SELECT CAST(scope_identity() AS int)
go



CREATE PROCEDURE dbo.AtualizarUsuario 
(
	@id int,
	@nome varchar(70),
	@email varchar(100),
	@sexo char(1),
	@rg varchar(15),
	@cpf char(14),
	@nomeMae varchar(70),
	@situacaoCadastro char(1),
	@dataCadastro datetimeoffset
)
AS
	UPDATE [dbo].[Usuarios] SET 
	Nome = @nome,
	Email = @email,
	Sexo = @sexo,
	RG = @rg,
	CPF = @cpf,
	NomeMae = @nomeMae,
	SituacaoCadastro = @situacaoCadastro, 
	DataCadastro = @dataCadastro
	WHERE Id = @id
go

CREATE PROCEDURE dbo.DeletarUsuario
(
	@id int
)
AS
	DELETE FROM [dbo].[Usuarios] WHERE Id = @id
go
