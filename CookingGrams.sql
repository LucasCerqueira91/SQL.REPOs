CREATE DATABASE CookingGrams

USE CookingGrams
use Vehicles
CREATE DATABASE CookingGrams

DROP TABLE Ratings

DROP DATABASE Cookingrams;
Difficulty Recipe_Favorite

CREATE TABLE Categories (
ID INT PRIMARY KEY IDENTITY(1,1),
Title_C NVARCHAR (50) NOT NULL,
FkRecipe_ID INT NOT NULL
);

--CREATE TABLE Difficulty(
--ID INT PRIMARY KEY IDENTITY,
--Name_Dificulty NVARCHAR (15) NOT NULL CHECK (Name_Dificulty IN('Easy','EASY','easy','Facil','FACIL','facil',
--'medium''MEDIUM', 'Medium', 'medio''MEDIO', 'Medio',
--'hard','HARD','Hard', 'dificil','DIFICIL', 'Dificil')), 
--FkRecipe_ID INT NOT NULL,
--FkCategory_ID INT NOT NULL); 

CREATE TABLE Ingredients (
ID INT PRIMARY KEY IDENTITY(1,1),
Name_I NVARCHAR (50));

CREATE TABLE Ingredients_Description(
ID INT PRIMARY KEY IDENTITY(1,1),
Description_Ig NVARCHAR (50) NOT NULL,
FKIngredient_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL,
FkIngredients_Unit_Measurement_ID INT NOT NULL);  

CREATE TABLE Ingredients_Unit_Measurement(
ID INT PRIMARY KEY IDENTITY(1,1),
Quantity_ INT NOT NULL,
Measurement_Unit NVARCHAR (15) NOT NULL CHECK (Measurement_Unit IN('Kg','Ml','Gr','Lts')));

--CREATE TABLE Ratings (
--ID INT PRIMARY KEY IDENTITY(1,1),
--Rating_U NCHAR (1) NOT NULL,
--Comment_U NVARCHAR(100) NULL,
--FkUser_ID INT NOT NULL,
--FkRecipe_ID INT NOT NULL
--);

CREATE TABLE Ratings (
Id INT PRIMARY KEY IDENTITY(1,1),
RatingValue INT NOT NULL CHECK (RatingValue BETWEEN 1 AND 5),
Comment VARCHAR(255) NULL,
FkUser_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL,
Stars AS REPLICATE('*', RatingValue)
);

CREATE TABLE Recipes_Favorite(
ID INT PRIMARY KEY IDENTITY(1,1),
FkUser_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL,
FkCategory_ID INT NOT NULL);

/*CREATE TABLE Recipes_Ingredients (
ID INT PRIMARY KEY IDENTITY,
FkRecipe_ID INT NOT NULL);
*/

CREATE TABLE Recipes (
ID INT PRIMARY KEY IDENTITY(1,1),
Title_R NVARCHAR (100) NOT NULL,
Description_R NVARCHAR(200) NOT NULL,
PreparationMethod_R NVARCHAR(200) NOT NULL,
PreparationTime NVARCHAR(50) NOT NULL,
FkUser_ID INT NOT NULL);

--FkCategory_ID INT NOT NULL,
--FkRating_ID INT NOT NULL,
--FkIngredients_Description_ID INT NOT NULL);

CREATE TABLE Users (
ID INT PRIMARY KEY IDENTITY(1,1),
Name_U NVARCHAR (50) NOT NULL,
Email_U NVARCHAR(50) NOT NULL,
Password_U NVARCHAR(2000) NOT NULL,
IsBlocked_U BIT NOT NULL,
Admin_U BIT NOT NULL);

Ingredients_Description, FKIngredient_ID, FkIngredients_Unit_Measurement_ID


ALTER TABLE Ingredients_Description ADD CONSTRAINT FkIngredient_ID_Ingredient_Description
FOREIGN KEY (FKIngredient_ID) REFERENCES Ingredients(ID);

ALTER TABLE Ingredients_Description ADD CONSTRAINT FKUnit_Measurement_ID_Ingredient_Description
FOREIGN KEY (FkIngredients_Unit_Measurement_ID) REFERENCES Ingredients_Unit_Measurement(ID);


ALTER TABLE Ingredients_Description ADD CONSTRAINT FkRecipe_ID_Ingredient_Description
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);


ALTER TABLE Ratings ADD CONSTRAINT FkUser_ID_Ratings
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

ALTER TABLE Ratings ADD CONSTRAINT FkRecipe_ID_Ratings
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

ALTER TABLE Recipes_Favorite ADD CONSTRAINT Recipes_Favorite_ID_Users
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

ALTER TABLE Recipes_Favorite ADD CONSTRAINT Recipes_Favorite_ID_Recipes
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

ALTER TABLE Recipes_Favorite ADD CONSTRAINT Recipes_Favorite_ID_Categories
FOREIGN KEY (FkCategory_ID) REFERENCES Categories(ID);

ALTER TABLE Recipes ADD CONSTRAINT Recipes_ID_Users
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

ALTER TABLE Categories ADD CONSTRAINT Categories_ID_Recipes
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

--ALTER TABLE Recipes ADD CONSTRAINT Category_ID_Recipes
--FOREIGN KEY (FkCategory_ID) REFERENCES Categories(ID);

--ALTER TABLE Recipes ADD CONSTRAINT Recipes_ID_Ratings
--FOREIGN KEY (FkRating_ID) REFERENCES Ratings(ID);

--ALTER TABLE Recipes ADD CONSTRAINT Recipes_ID_Ingredients_Description
--FOREIGN KEY (FkIngredients_Description_ID) REFERENCES Ingredients_Description(ID);

--ALTER TABLE Ingredients_Description DROP COLUMN FkIngredients_Description_ID INT NOT NULL

--ALTER TABLE Recipes ADD FkIngredients_Description_ID INT NOT NULL;

--ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Recipes_ID_Recipes_Ingredients
--FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

--ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Ingredients_ID_Recipes_Ingredients
--FOREIGN KEY (FkIngredient_ID) REFERENCES Ingredients(ID);

--ALTER TABLE Recipes ADD CONSTRAINT Ingredients_Description_ID_Recipes
--FOREIGN KEY (FkIngredients_Description_ID) REFERENCES Ingredients_Description(ID);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--STORED PROCEDURES
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 --Stored Procedures CookingGrams
 
 -- Category
GO
CREATE PROCEDURE GetCategoryById (@Id INT)
AS
BEGIN

SELECT * FROM Categories
WHERE ID = @Id

END

GO
CREATE PROCEDURE GetAllCategory
AS
BEGIN

SELECT * FROM Categories

END

-- GO
-- CREATE PROCEDURE GetAllCategoryByRecipe (@Id INT)
-- AS
-- BEGIN

-- SELECT * FROM Categories
-- WHERE FkRecipe_ID = @Id

-- END


GO
CREATE PROCEDURE AddCategory (@Title NVARCHAR(40), @IdRecipe INT)
AS
BEGIN

INSERT INTO Categories 
("Title_C") --, "FkRecipe_ID") 
VALUES 
(@Title)--, @IdRecipe)

END

GO
CREATE PROCEDURE UpdateCategory (@Title NVARCHAR(40), @IdRecipe INT)
AS
BEGIN

UPDATE Categories SET "Title_C" = @Title --, "FkRecipe_ID" = @IdRecipe
WHERE ID = @Id

END

GO
CREATE PROCEDURE DeleteCategory (@Id INT)
AS
BEGIN

DELETE FROM Categories
WHERE ID = @Id

END
----------------------------------------------------------------------------------------------------------------------------------
-- Ingredient
GO
CREATE PROCEDURE GetIngredientById (@Id INT)
AS
BEGIN

SELECT * FROM Ingredients
WHERE ID = @Id

END

GO
CREATE PROCEDURE GetAllIngredient
AS
BEGIN

SELECT * FROM Ingredients

END

-- GO
-- CREATE PROCEDURE GetAllIngredientByRecipeIngredient (@Id INT)
-- AS
-- BEGIN
-- SELECT * FROM Ingredients
-- LEFT JOIN Recipes_Ingredients
-- ON Ingredients.ID = Recipes_Ingredients.FkIngredient_ID

-- WHERE FkIngredient_ID = @Id

-- END

-- criar uma tabela para as quantidades com gramas litros 

GO
CREATE PROCEDURE AddIngredient (@Name NVARCHAR(50)) --, @Quantity NVARCHAR(50), @Unit NVARCHAR(50), @Description NVARCHAR(800)
AS
BEGIN

INSERT INTO Ingredients 
("Name_I") 
VALUES 
(@Name) -- @Quantity, @Unit, @Description

END

GO
CREATE PROCEDURE UpdateIngredient (@Name NVARCHAR(50))--, @Quantity NVARCHAR(50), @Unit NVARCHAR(50), @Description NVARCHAR(800))
AS
BEGIN

UPDATE Ingredients SET "Name_I" = @Name --, "Quantity_I" = @Quantity, "Unit_I" = @Unit, "Description_I" = @Description
WHERE ID = @Id

END

GO
CREATE PROCEDURE DeleteIngredient (@Id INT)
AS
BEGIN

DELETE FROM Ingredients
WHERE ID = @Id

END

---------------------------------------------------------------------------------------------------------------------------------
--    IngredientDescription 
--GetById(int id);
GO
CREATE PROCEDURE GetIngredientDescriptionById (@Id INT)
AS
BEGIN

SELECT * FROM Ingredients_Description
WHERE ID = @Id

END
--         List<IngredientDescription> GetAll();
GO
CREATE PROCEDURE GetAllIngredientDescription
AS
BEGIN

SELECT * FROM Ingredients_Description

END

--         List<IngredientDescription> GetAllByIngredient(int ingredientId);
GO
CREATE PROCEDURE GetAllIngredientDescriptionByIngredient (@Id INT)
AS
BEGIN
SELECT * FROM Ingredients_Description
LEFT JOIN Ingredients
ON Ingredients.ID = Ingredients_Description.FKIngredient_ID
WHERE FKIngredient_ID = @Id

END
--         List<IngredientDescription> GetAllByIngredientUnitMeasurement(int unitMeasurementId);
GO
CREATE PROCEDURE GetAllIngredientDescriptionByIngredientUnitMeasurement (@Id INT)
AS
BEGIN
SELECT * FROM Ingredients_Description
LEFT JOIN IngredientUnitMeasurement
ON IngredientUnitMeasurement.ID = Ingredients_Description.FkIngredients_Unit_Measurement_ID
WHERE FkIngredients_Unit_Measurement_ID = @Id

END
--         IngredientDescription Add(IngredientDescription ingredientDescription);
GO
CREATE PROCEDURE AddIngredientsDescription (@IngredientDescription NVARCHAR(50), @IdIngredient INT, @IdIngredientUnitMeasurement INT)
AS
BEGIN

INSERT INTO Ingredients_Description 
("Description_IDesc", "FKIngredient_ID", "FkIngredients_Unit_Measurement_ID") 
VALUES 
(@IngredientDescription, @IdIngredient, @IdIngredientUnitMeasurement)

END
--         IngredientDescription Update(IngredientDescription ingredientDescription);
GO
CREATE PROCEDURE UpdateIngredientsDescription (@IngredientDescription NVARCHAR(50), @IdIngredient INT, @IdIngredientUnitMeasurement INT)
AS
BEGIN
UPDATE Ingredients_Description SET "Description_IDesc" = @IngredientDescription, "FKIngredient_ID" = @IdIngredient, "FkIngredients_Unit_Measurement_ID" = @IdIngredientUnitMeasurement
WHERE ID = @Id
END

--         void Delete(int id);
GO
CREATE PROCEDURE DeleteIngredientsDescription (@Id INT)
AS
BEGIN

DELETE FROM Ingredients_Description
WHERE ID = @Id

END

---------------------------------------------------------------------------------------------------------------------------------
    -- IngredientUnitMeasurement 
    --GetById(int id);
GO
CREATE PROCEDURE GetIngredientUnitMeasurementById (@Id INT)
AS
BEGIN

SELECT * FROM Ingredients_Unit_Measurement
WHERE ID = @Id

END
    --     List<IngredientUnitMeasurement> GetAll();
GO
CREATE PROCEDURE GetAllIngredientUnitMeasurement
AS
BEGIN

SELECT * FROM Ingredients_Unit_Measurement

END

    --     IngredientUnitMeasurement Add(IngredientUnitMeasurement ingredientUnitMeasurement);
GO
CREATE PROCEDURE AddIngredientUnitMeasurement (@MeasurementUnit NVARCHAR(15))
AS
BEGIN

INSERT INTO Ingredients_Unit_Measurement 
("Measurement_Unit") 
VALUES 
(@MeasurementUnit)

END
    --     IngredientUnitMeasurement Update(IngredientUnitMeasurement ingredientUnitMeasurement);
GO
CREATE PROCEDURE UpdateIngredientUnitMeasurement (@MeasurementUnit NVARCHAR(15))
AS
BEGIN
UPDATE Ingredients_Unit_Measurement SET "Measurement_Unit" = @MeasurementUnit
WHERE ID = @Id
END
    --     void Delete(int id);
GO
CREATE PROCEDURE DeleteIngredientUnitMeasurement (@Id INT)
AS
BEGIN

DELETE FROM Ingredients_Unit_Measurement
WHERE ID = @Id

END
---------------------------------------------------------------------------------------------------------------------------------
--Rating

GO
CREATE PROCEDURE GetRatingById (@Id INT)
AS
BEGIN

SELECT * FROM Ratings
WHERE ID = @Id

END

GO
CREATE PROCEDURE GetAllRating
AS
BEGIN

SELECT * FROM Ratings

END

GO
CREATE PROCEDURE GetAllRatingByUser (@Id INT)
AS
BEGIN

SELECT * FROM Ratings
WHERE FkUser_ID = @Id

END

GO
CREATE PROCEDURE AddRating (@Ratings NCHAR(1), @Comment NVARCHAR(100), @IdUser INT)
AS
BEGIN

INSERT INTO Ratings 
("Rating_U", "Comment_U", "FkUser_ID") 
VALUES 
(@Ratings, @Comment, @IdUser)

END

GO
CREATE PROCEDURE UpdateRating (@Ratings NCHAR(1), @Comment NVARCHAR(100), @IdUser INT)
AS
BEGIN

UPDATE Ratings SET "Rating_U" = @Ratings, "Comment_U" = @Comment, "FkUser_ID" = @IdUser
WHERE ID = @Id

END

GO
CREATE PROCEDURE DeleteRating (@Id INT)
AS
BEGIN

DELETE FROM Ratings
WHERE ID = @Id

END

--------------------------------------------------------------------------------------------------------------------------------------
--Recipe Favorite

GO
CREATE PROCEDURE GetRecipeFavoriteById (@Id INT)
AS
BEGIN

SELECT * FROM Favorite_Recipe
WHERE ID = @Id

END

GO
CREATE PROCEDURE GetAllRecipeFavorite
AS
BEGIN

SELECT * FROM Favorite_Recipe

END

GO
CREATE PROCEDURE GetAllRecipeFavoriteByUser (@Id INT)
AS
BEGIN
SELECT * FROM Favorite_Recipe
LEFT JOIN Users
ON Users.ID = Favorite_Recipe.FkUser_ID

WHERE FkUser_ID = @Id

END

GO
CREATE PROCEDURE GetAllRecipeFavoriteByRecipe (@Id INT)
AS
BEGIN

SELECT * FROM Favorite_Recipe
LEFT JOIN Recipes
ON Recipes.ID = Favorite_Recipe.FkRecipe_ID
WHERE FkRecipe_ID = @Id


END

GO
CREATE PROCEDURE GetAllRecipeFavoriteByCategory (@Id INT)
AS
BEGIN

SELECT * FROM Favorite_Recipe
LEFT JOIN Categories
ON Categories.ID = Favorite_Recipe.FkCategory_ID
WHERE FkCategory_ID = @Id


END

GO
CREATE PROCEDURE AddRecipeFavorite (@IdRecipe INT, @IdUser INT, @IdCategory INT)
AS
BEGIN

INSERT INTO Favorite_Recipe 
("FkUser_ID", "FkRecipe_ID", "FkCategory_ID")

VALUES 
(@IdRecipe, @IdUser, @IdCategory)

END

GO
CREATE PROCEDURE UpdateRecipeFavorite (@IdRecipe INT, @IdUser INT, @IdCategory INT)
AS
BEGIN

UPDATE Favorite_Recipe SET "FkUser_ID" = @IdRecipe, "FkRecipe_ID" = @IdUser, "FkCategory_ID" = @IdCategory
WHERE ID = @Id

END

GO
CREATE PROCEDURE DeleteRecipeFavorite (@Id INT)
AS
BEGIN

DELETE FROM Favorite_Recipe
WHERE ID = @Id

END
--------------------------------------------------------------------------------------------------------------------------------------

--Recipe Ingredient

-- GO
-- CREATE PROCEDURE GetRecipeIngredientById (@Id INT)
-- AS
-- BEGIN

-- SELECT * FROM Recipes_Ingredients
-- WHERE ID = @Id

-- END

-- GO
-- CREATE PROCEDURE GetAllRecipeIngredient
-- AS
-- BEGIN

-- SELECT * FROM Recipes_Ingredients

-- END

-- GO
-- CREATE PROCEDURE GetAllRecipeIngredientbyRecipe (@Id INT)
-- AS
-- BEGIN


-- SELECT * FROM Recipes_Ingredients
-- LEFT JOIN Recipes
-- ON Recipes.ID = Recipes_Ingredients.FkRecipe_ID
-- WHERE FkRecipe_ID = @Id

-- END


-- GO
-- CREATE PROCEDURE AddRecipeIngredient (@IdRecipe INT, @IdIngredient INT)
-- AS
-- BEGIN

-- INSERT INTO Recipes_Ingredients 
-- ("FkRecipe_ID", "FkIngredient_ID") 
-- VALUES 
-- (@IdRecipe, @IdIngredient)

-- END

-- GO
-- CREATE PROCEDURE UpdateRecipeIngredient (@Brand VARCHAR(100), @Model VARCHAR(200), @RegistrationNumber VARCHAR(20), @RegistrationDate DATE, @StandId INT, @Id INT)
-- AS
-- BEGIN

-- UPDATE Recipes_Ingredients SET "FkRecipe_ID" = @IdRecipe, "FkIngredient_ID" = @IdIngredient
-- WHERE ID = @Id

-- END

-- GO
-- CREATE PROCEDURE DeleteRecipeIngredient (@Id INT)
-- AS
-- BEGIN

-- DELETE FROM Recipes_Ingredients
-- WHERE ID = @Id

-- END
---------------------------------------------------------------------------------------------------------------------------------------
--Recipe

GO
CREATE PROCEDURE GetRecipeById (@Id INT)
AS
BEGIN

SELECT * FROM Recipes
WHERE ID = @Id

END

GO
CREATE PROCEDURE GetAllRecipe
AS
BEGIN

SELECT * FROM Recipes

END

GO
CREATE PROCEDURE GetAllRecipeByCategory (@Id INT)
AS
BEGIN

SELECT * FROM Recipes
WHERE FkCategory_ID = @Id

END


GO
CREATE PROCEDURE GetAllRecipeByRating (@Id INT)
AS
BEGIN

SELECT * FROM Recipes
WHERE FkRating_ID = @Id

SELECT * FROM Recipes
LEFT JOIN Ratings
ON Recipes.ID = Ratings.FkRecipe_ID
WHERE FkRecipe_ID = @Id

END

GO
CREATE PROCEDURE GetAllRecipeByUser (@Id INT)
AS
BEGIN

SELECT * FROM Recipes
WHERE FkUser_ID = @Id

END

GO
CREATE PROCEDURE GetAllRecipeByCategory (@Id INT)
AS
BEGIN

SELECT * FROM Recipes
WHERE FkCategory_ID = @Id

END

GO
CREATE PROCEDURE AddRecipe (@Title NVARCHAR(100), @Description NVARCHAR(200), @PreparationMethod NVARCHAR(200), @PreparationTime INT, @IdUser INT, @IdCategory INT, @IdIngredientDescription INT, @IdRating INT)
AS
BEGIN

INSERT INTO Recipes 
("Title_R", "Description_R", "PreparationMethod_R", "PreparationTime", "FkUser_ID", "FkCategory_ID", "FkIngredients_Description_ID","FkRating_ID") 
VALUES 
(@Title, @Description, @PreparationMethod, @PreparationTime, @UserId, @IdCategory, @IdIngredientDescription, @IdRating)

END

GO
CREATE PROCEDURE UpdateRecipe (@Title NVARCHAR(100), @Description NVARCHAR(200), @PreparationMethod NVARCHAR(200), @PreparationTime INT, @UserId INT, @IdCategory INT, @IdIngredientDescription INT, @IdRating INT)
AS
BEGIN

UPDATE Recipes SET "Title_R" = @Title, "Description_R" = @Description, "PreparationMethod_R" = @PreparationMethod, "PreparationTime" = @PreparationTime, "FkUser_ID" = @IdUser, "FkCategory_ID" = @IdCategory, "FkIngredients_Description_ID" = @IdIngredientDescription, "FkRating_ID" = @IdRating
WHERE ID = @Id

END

GO
CREATE PROCEDURE DeleteRecipe (@Id INT)
AS
BEGIN

DELETE FROM Recipes
WHERE ID = @Id

END

-------------------------------------------------------------------------------------------------------------------------------------

--User

GO
CREATE PROCEDURE GetUserById (@Id INT)
AS
BEGIN

SELECT * FROM Users
WHERE ID = @Id

END

GO
CREATE PROCEDURE GetAllUser
AS
BEGIN

SELECT * FROM Users

END


GO
CREATE PROCEDURE AddUser (@Name NVARCHAR(50), @Email NVARCHAR(50) ,@Password NVARCHAR(2000), @IsBlocked NCHAR(1), @IsAdmin NCHAR(1))
AS
BEGIN

INSERT INTO Users 
("Name_U", "Email_U", "Password_U", "IsBlocked_U", "Admin_U") 
VALUES 
(@Name, @Email, @Password, @IsBlocked, @IsAdmin)

END

GO
CREATE PROCEDURE UpdateUser (@Name NVARCHAR(50), @Email NVARCHAR(50) ,@Password NVARCHAR(2000), @IsBlocked NCHAR(1), @IsAdmin NCHAR(1))
AS
BEGIN

UPDATE Users SET "Name_U" = @Name, "Email_U" = @Email, "Password_U" = @Password, "IsBlocked_U" = @IsBlocked, "Admin_U" = @IsAdmin
WHERE ID = @Id

END

GO
CREATE PROCEDURE DeleteUser (@Id INT)
AS
BEGIN

DELETE FROM Users
WHERE ID = @Id

END
