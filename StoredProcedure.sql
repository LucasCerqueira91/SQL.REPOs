
GO
CREATE PROCEDURE AddCar (@Brand VARCHAR(100), @Model VARCHAR(200), @RegistrationNumber VARCHAR(20), @RegistrationDate DATE, @StandId INT)
AS
BEGIN

INSERT INTO Cars 
("Brand", "Model", "RegistrationNumber", "RegistrationDate", "StandId") 
VALUES 
(@Brand, @Model, @RegistrationNumber, @RegistrationDate, @StandId)

END

GO
CREATE PROCEDURE AddStand (@Name VARCHAR(150), @Location VARCHAR(250))
AS
BEGIN

INSERT INTO Stands ("Name", "Location") VALUES (@Name, @Location)

END

GO
CREATE PROCEDURE DeleteCar (@Id INT)
AS
BEGIN

DELETE FROM Cars
WHERE Id = @Id

END

GO
CREATE PROCEDURE DeleteStand (@Id INT)
AS
BEGIN

DELETE FROM Stands
WHERE Id = @Id

END

GO
CREATE PROCEDURE GetAllCars
AS
BEGIN

SELECT * FROM Cars

END

GO
CREATE PROCEDURE GetAllCarsByStand (@Id INT)
AS
BEGIN

SELECT * FROM Cars
WHERE StandId = @Id

END

GO
CREATE PROCEDURE GetAllStands
AS
BEGIN

SELECT * FROM Stands

END

GO
CREATE PROCEDURE GetCarById (@Id INT)
AS
BEGIN

SELECT * FROM Cars
WHERE Id = @Id

END

GO
CREATE PROCEDURE GetStandById (@Id INT)
AS
BEGIN

SELECT * FROM Stands
WHERE Id = @Id

END

GO
CREATE PROCEDURE UpdateCar (@Brand VARCHAR(100), @Model VARCHAR(200), @RegistrationNumber VARCHAR(20), @RegistrationDate DATE, @StandId INT, @Id INT)
AS
BEGIN

UPDATE Cars SET "Brand" = @Brand, "Model" = @Model, "RegistrationNumber" = @RegistrationNumber, "RegistrationDate" = @RegistrationDate, "StandId" = @StandId
WHERE Id = @Id

END

GO
CREATE PROCEDURE UpdateStand (@Id INT, @Name VARCHAR(150), @Location VARCHAR(250))
AS
BEGIN

UPDATE Stands SET "Name" = @Name, "Location" = @Location 
WHERE Id = @Id

END
