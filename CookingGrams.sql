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
USE CookingGrams

--Stored Procedures CookingGrams
 DROP PROCEDURE AddCategory;
 DROP PROCEDURE AddIngredient;
 DROP PROCEDURE AddIngredientsDescription;
 DROP PROCEDURE AddIngredientUnitMeasurement;
 DROP PROCEDURE DeleteCategory;
  DROP PROCEDURE DeleteIngredient;
 DROP PROCEDURE DeleteIngredientsDescription;
 DROP PROCEDURE GetAllByUser;
 DROP PROCEDURE GetAllCategory;
 DROP PROCEDURE GetAllIngredient;
  DROP PROCEDURE GetAllIngredientDescription;
 DROP PROCEDURE GetAllIngredientDescriptionByIngredient;
 DROP PROCEDURE GetAllIngredientDescriptionByIngredientUnitMeasurement;
 DROP PROCEDURE GetAllIngredientUnitMeasurement;
 DROP PROCEDURE GetAllRating;
  DROP PROCEDURE GetCategoryById;
 DROP PROCEDURE GetIngredientById;
 DROP PROCEDURE GetIngredientDescriptionById;
 DROP PROCEDURE GetIngredientUnitMeasurementById;
 DROP PROCEDURE GetRatingById;
   DROP PROCEDURE UpdateCategory;
 DROP PROCEDURE UpdateIngredient;
 DROP PROCEDURE UpdateIngredientsDescription;
 DROP PROCEDURE UpdateIngredientUnitMeasurement;
 DROP PROCEDURE AddRating;
  DROP PROCEDURE DeleteIngredientUnitMeasurement;
   DROP PROCEDURE DeleteRating;
    DROP PROCEDURE GetAllRatingByRecipe;
	 DROP PROCEDURE GetAllRatingByUser;
	  DROP PROCEDURE GetAllRecipeFavorite;
	   DROP PROCEDURE GetAllRecipeFavoriteByCategory;
	    DROP PROCEDURE GetAllRecipeFavoriteByRecipe;
		 DROP PROCEDURE GetAllRecipeFavoriteByUser;
		  DROP PROCEDURE GetRecipeFavoriteById;
		   DROP PROCEDURE UpdateRating;
 -- Category
GO
CREATE PROCEDURE GetCategoryById (@GetCategoryById INT)
AS
BEGIN

SELECT * FROM Categories
WHERE ID = @GetCategoryById

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
CREATE PROCEDURE AddCategory (@Title NVARCHAR(50), @RecipeId INT)
AS
BEGIN

INSERT INTO Categories 
("Title_C" , "FkRecipe_ID") 
VALUES 
(@Title, @RecipeId)

END

GO
CREATE PROCEDURE UpdateCategory (@UpdateCategoryId INT , @Title NVARCHAR(50), @RecipeId INT)
AS
BEGIN

UPDATE Categories SET "Title_C" = @Title , "FkRecipe_ID" = @RecipeId
WHERE ID = @UpdateCategoryId

END
DROP PROCEDURE DeleteCategory;
GO
CREATE PROCEDURE DeleteCategory (@DeleteCategoryId INT)
AS
BEGIN

DELETE FROM Categories
WHERE ID = @DeleteCategoryId

END
----------------------------------------------------------------------------------------------------------------------------------
-- Ingredient
GO
CREATE PROCEDURE GetIngredientById (@GetIngredientById INT)
AS
BEGIN

SELECT * FROM Ingredients
WHERE ID = @GetIngredientById

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
CREATE PROCEDURE UpdateIngredient (@UpdateIngredientId INT, @Name NVARCHAR(50))--, @Quantity NVARCHAR(50), @Unit NVARCHAR(50), @Description NVARCHAR(800))
AS
BEGIN

UPDATE Ingredients SET "Name_I" = @Name --, "Quantity_I" = @Quantity, "Unit_I" = @Unit, "Description_I" = @Description
WHERE ID = @UpdateIngredientId

END

GO
CREATE PROCEDURE DeleteIngredient (@DeleteIngredientId INT)
AS
BEGIN

DELETE FROM Ingredients
WHERE ID = @DeleteIngredientId

END

---------------------------------------------------------------------------------------------------------------------------------
--    IngredientDescription 
--GetById(int id);

DROP PROCEDURE GetIngredientDescriptionById

GO
CREATE PROCEDURE GetIngredientDescriptionById (@GetIngredientDescriptionById INT)
AS
BEGIN

SELECT * FROM Ingredients_Description
WHERE ID = @GetIngredientDescriptionById

END
--         List<IngredientDescription> GetAll();
GO
CREATE PROCEDURE GetAllIngredientDescription
AS
BEGIN

SELECT * FROM Ingredients_Description

END

--         List<IngredientDescription> GetAllByIngredient(int ingredientId);
DROP PROCEDURE GetAllIngredientDescriptionByIngredient;
GO
CREATE PROCEDURE GetAllIngredientDescriptionByIngredient (@GetAllIngredientDescriptionByIngredientId INT)
AS
BEGIN
SELECT * FROM Ingredients_Description
LEFT JOIN Ingredients
ON Ingredients.ID = Ingredients_Description.FKIngredient_ID
WHERE FKIngredient_ID = @GetAllIngredientDescriptionByIngredientId

END
--         List<IngredientDescription> GetAllByIngredientUnitMeasurement(int unitMeasurementId
DROP PROCEDURE GetAllIngredientDescriptionByIngredientUnitMeasurement;
GO
CREATE PROCEDURE GetAllIngredientDescriptionByIngredientUnitMeasurement (@GetAllIngredientDescriptionByIngredientUnitMeasurementId INT)
AS
BEGIN
SELECT * FROM Ingredients_Description
LEFT JOIN Ingredients_Unit_Measurement
ON Ingredients_Unit_Measurement.ID = Ingredients_Description.FkIngredients_Unit_Measurement_ID
WHERE FkIngredients_Unit_Measurement_ID = @GetAllIngredientDescriptionByIngredientUnitMeasurementId

END
--         IngredientDescription Add(IngredientDescription ingredientDescription);
GO
CREATE PROCEDURE AddIngredientsDescription (@IngredientDescription NVARCHAR(50), @IngredientId INT, @RecipeId INT, @IngredientUnitMeasurementId INT)
AS
BEGIN

INSERT INTO Ingredients_Description 
("Description_Ig", "FKIngredient_ID", "FkRecipe_ID", "FkIngredients_Unit_Measurement_ID") 
VALUES 
(@IngredientDescription, @IngredientId, @RecipeId, @IngredientUnitMeasurementId)

END
--         IngredientDescription Update(IngredientDescription ingredientDescription);
GO
CREATE PROCEDURE UpdateIngredientsDescription (@UpdateIngredientsDescriptionId INT , @IngredientDescription NVARCHAR(50), @IngredientId INT, @RecipeId INT, @IngredientUnitMeasurementId INT)
AS
BEGIN
UPDATE Ingredients_Description SET "Description_Ig" = @IngredientDescription, "FKIngredient_ID" = @IngredientId, "FkIngredients_Unit_Measurement_ID" = @IngredientUnitMeasurementId
WHERE ID = @UpdateIngredientsDescriptionId
END

--         void Delete(int id);
DROP PROCEDURE DeleteIngredientsDescription;
GO
CREATE PROCEDURE DeleteIngredientsDescription (@DeleteIngredientsDescriptionId INT)
AS
BEGIN

DELETE FROM Ingredients_Description
WHERE ID = @DeleteIngredientsDescriptionId

END

---------------------------------------------------------------------------------------------------------------------------------
    -- IngredientUnitMeasurement 
    --GetById(int id);
GO
CREATE PROCEDURE GetIngredientUnitMeasurementById (@GetIngredientUnitMeasurementById INT)
AS
BEGIN

SELECT * FROM Ingredients_Unit_Measurement
WHERE ID = @GetIngredientUnitMeasurementById

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
CREATE PROCEDURE AddIngredientUnitMeasurement (@Quantity INT, @MeasurementUnit NVARCHAR(15))
AS
BEGIN

INSERT INTO Ingredients_Unit_Measurement 
("Quantity_", "Measurement_Unit") 
VALUES 
(@Quantity, @MeasurementUnit)

END
    --     IngredientUnitMeasurement Update(IngredientUnitMeasurement ingredientUnitMeasurement);
DROP PROCEDURE UpdateIngredientUnitMeasurement;

GO
CREATE PROCEDURE UpdateIngredientUnitMeasurement (@UpdateIngredientUnitMeasurementId INT, @Quantity INT, @MeasurementUnit NVARCHAR(15))
AS
BEGIN
    UPDATE Ingredients_Unit_Measurement 
    SET "Measurement_Unit" = @MeasurementUnit, "Quantity_" = @Quantity
    WHERE ID = @UpdateIngredientUnitMeasurementId
END
    --     void Delete(int id);
	DROP PROCEDURE DeleteIngredientUnitMeasurement;
GO
CREATE PROCEDURE DeleteIngredientUnitMeasurement (@DeleteIngredientUnitMeasurementId INT)
AS
BEGIN

DELETE FROM Ingredients_Unit_Measurement
WHERE ID = @DeleteIngredientUnitMeasurementId

END
---------------------------------------------------------------------------------------------------------------------------------
--Rating

GO
CREATE PROCEDURE GetRatingById (@GetRatingById INT)
AS
BEGIN

SELECT * FROM Ratings
WHERE ID = @GetRatingById

END

GO
CREATE PROCEDURE GetAllRating
AS
BEGIN

SELECT * FROM Ratings

END
DROP PROCEDURE GetAllRatingByUser;
GO
CREATE PROCEDURE GetAllRatingByUser (@GetAllRatingByUserId INT)
AS
BEGIN
    SELECT Ratings.Id, Ratings.RatingValue, Ratings.Comment, Ratings.FkRecipe_ID, Users.Name_U as UserName
    FROM Ratings 
    LEFT JOIN Users  ON Ratings.FkUser_ID = Users.ID
    WHERE Ratings.FkUser_ID = @GetAllRatingByUserId
END

GO
CREATE PROCEDURE GetAllRatingByRecipe (@GetAllRatingByRecipeId INT)
AS
BEGIN
    SELECT Ratings. *, Users. *
    FROM Ratings
    LEFT JOIN Users ON Ratings.FkUser_ID = Users.Id
    WHERE Ratings.FkRecipe_ID = @GetAllRatingByRecipeId
END

--CREATE PROCEDURE GetAllRatingByUser (@Id INT)
--AS
--BEGIN

--SELECT * FROM Ratings
--WHERE FkUser_ID = @Id

--END

GO
CREATE PROCEDURE AddRating (@RatingValue INT, @Comment VARCHAR(255), @UserId INT, @RecipeId INT)
AS
BEGIN

INSERT INTO Ratings 
("RatingValue", "Comment", "FkUser_ID", "FkRecipe_ID") 
VALUES 
(@RatingValue, @Comment, @UserId, @RecipeId)

END
sp_helptext 'DeleteRecipe'
DROP PROCEDURE DeleteRecipe

GO
CREATE PROCEDURE UpdateRating (@UpdateRatingId INT, @RatingValue INT, @Comment VARCHAR(255), @UserId INT, @RecipeId INT)
AS
BEGIN
UPDATE Ratings SET "RatingValue" = @RatingValue, "Comment" = @Comment, "FkUser_ID" = @UserId, "FkRecipe_ID" = @RecipeId
WHERE ID = @UpdateRatingId

END

GO
CREATE PROCEDURE DeleteRating (@DeleteRatingId INT)
AS
BEGIN

DELETE FROM Ratings
WHERE ID = @DeleteRatingId

END

--------------------------------------------------------------------------------------------------------------------------------------
--Recipe Favorite

GO
CREATE PROCEDURE GetRecipeFavoriteById (@GetRecipeFavoriteById INT)
AS
BEGIN

SELECT * FROM Recipes_Favorite
WHERE ID = @GetRecipeFavoriteById

END

GO
CREATE PROCEDURE GetAllRecipeFavorite
AS
BEGIN

SELECT * FROM Recipes_Favorite

END

GO
CREATE PROCEDURE GetAllRecipeFavoriteByUser (@GetAllRecipeFavoriteByUserId INT)
AS
BEGIN
    SELECT Recipes. * 
    FROM Recipes 
    INNER JOIN Recipes_Favorite ON Recipes.Id = Recipes_Favorite.FkRecipe_ID
    WHERE Recipes_Favorite.FkUser_ID = @GetAllRecipeFavoriteByUserId;
END

--GO
--CREATE PROCEDURE GetAllRecipeFavoriteByUser (@Id INT)
--AS
--BEGIN
--SELECT * FROM Favorite_Recipe
--LEFT JOIN Users
--ON Users.ID = Favorite_Recipe.FkUser_ID

--WHERE FkUser_ID = @Id

--END

GO
CREATE PROCEDURE GetAllRecipeFavoriteByRecipe (@GetAllRecipeFavoriteByRecipeId INT)
AS
BEGIN

    SELECT Recipes. * 
    FROM Recipes 
    INNER JOIN Recipes_Favorite ON Recipes.Id = Recipes_Favorite.FkRecipe_ID
    WHERE Recipes_Favorite.FkRecipe_ID = @GetAllRecipeFavoriteByRecipeId;
END

GO
CREATE PROCEDURE GetAllRecipeFavoriteByCategory (@GetAllRecipeFavoriteByCategoryId INT)
AS
BEGIN
    SELECT Recipes. * 
    FROM Recipes 
    INNER JOIN Recipes_Favorite ON Recipes.Id = Recipes_Favorite.FkRecipe_ID
    WHERE Recipes_Favorite.FkCategory_ID = @GetAllRecipeFavoriteByCategoryId;
END

GO
CREATE PROCEDURE AddRecipeToFavorites (@UserId INT, @RecipeId INT, @CategoryId INT)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Recipes_Favorite WHERE FkUser_ID = @UserId AND FkRecipe_ID = @RecipeId AND FkCategory_ID = @CategoryId)
    BEGIN
        INSERT INTO Recipes_Favorite (FkUser_ID, FkRecipe_ID, FkCategory_ID ) VALUES (@UserId, @RecipeId,@CategoryId)
    END
END
--GO
--CREATE PROCEDURE AddRecipeFavorite (@IdRecipe INT, @IdUser INT, @IdCategory INT)
--AS
--BEGIN

--INSERT INTO Favorite_Recipe 
--("FkUser_ID", "FkRecipe_ID", "FkCategory_ID")

--VALUES 
--(@IdRecipe, @IdUser, @IdCategory)

--END

--GO
--CREATE PROCEDURE UpdateRecipeFavorite (@IdRecipe INT, @IdUser INT, @IdCategory INT)
--AS
--BEGIN

--UPDATE Favorite_Recipe SET "FkUser_ID" = @IdRecipe, "FkRecipe_ID" = @IdUser, "FkCategory_ID" = @IdCategory
--WHERE ID = @Id

--END

GO
CREATE PROCEDURE DeleteRecipeFavorite (@UserId INT, @RecipeId INT, @CategoryId INT)
AS
BEGIN

DELETE FROM Recipes_Favorite
WHERE FkUser_ID = @UserId AND FkRecipe_ID = @RecipeId AND  FkCategory_ID = @CategoryId

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

DROP PROCEDURE GetRecipeById
DROP PROCEDURE GetAllRecipe
DROP PROCEDURE GetAllRecipeByCategory
DROP PROCEDURE GetAllRecipeByRating
DROP PROCEDURE GetAllRecipeByUser
DROP PROCEDURE AddRecipe
DROP PROCEDURE UpdateRecipe 
DROP PROCEDURE DeleteRecipe

GO
CREATE PROCEDURE GetRecipeById (@GetRecipeById INT)
AS
BEGIN

SELECT * FROM Recipes
WHERE ID = @GetRecipeById

END

GO
CREATE PROCEDURE GetAllRecipe
AS
BEGIN

SELECT * FROM Recipes

END

GO
CREATE PROCEDURE GetAllRecipeByCategory (@GetAllRecipeByCategoryId INT)
AS
BEGIN

SELECT * FROM Recipes
INNER JOIN Categories
ON Recipes.ID = Categories.FkRecipe_ID
WHERE FkRecipe_ID = @GetAllRecipeByCategoryId
END


GO
CREATE PROCEDURE GetAllRecipeByRating (@GetAllRecipeByRatingId INT)
AS
BEGIN

SELECT * FROM Recipes
INNER JOIN Ratings
ON Recipes.ID = Ratings.FkRecipe_ID
WHERE FkRecipe_ID = @GetAllRecipeByRatingId

END

GO
CREATE PROCEDURE GetAllRecipeByUser (@GetAllRecipeByUserId INT)
AS
BEGIN

SELECT * FROM Recipes
INNER JOIN Users
ON Recipes.ID = Recipes.FkUser_ID
WHERE FkUser_ID = @GetAllRecipeByUserId

END

--GO
--CREATE PROCEDURE GetAllRecipeByCategory (@Id INT)
--AS
--BEGIN

--SELECT * FROM Recipes
--WHERE FkCategory_ID = @Id

--END

GO
CREATE PROCEDURE AddRecipe (@Title NVARCHAR(100), @Description NVARCHAR(200), @PreparationMethod NVARCHAR(200), @PreparationTime INT, @UserId INT)
AS
BEGIN

INSERT INTO Recipes 
("Title_R", "Description_R", "PreparationMethod_R", "PreparationTime", "FkUser_ID") 
VALUES 
(@Title, @Description, @PreparationMethod, @PreparationTime, @UserId)

END

GO
CREATE PROCEDURE UpdateRecipe (@UpdateRecipeId INT, @Title NVARCHAR(100), @Description NVARCHAR(200), @PreparationMethod NVARCHAR(200), @PreparationTime INT, @UserId INT)
AS
BEGIN

UPDATE Recipes SET "Title_R" = @Title, "Description_R" = @Description, "PreparationMethod_R" = @PreparationMethod, "PreparationTime" = @PreparationTime, "FkUser_ID" = @UserId
WHERE ID = @UpdateRecipeId

END

GO
CREATE PROCEDURE DeleteRecipe (@DeleteRecipeId INT)
AS
BEGIN

DELETE FROM Recipes
WHERE ID = @DeleteRecipeId

END

-------------------------------------------------------------------------------------------------------------------------------------
sp_helptext 'GetUserById'
--User

GO
CREATE PROCEDURE GetUserById (@GetUserById INT)
AS
BEGIN

SELECT * FROM Users
WHERE ID = @GetUserById

END

GO
CREATE PROCEDURE GetAllUser
AS
BEGIN

SELECT * FROM Users

END


GO
CREATE PROCEDURE AddUser (@Name NVARCHAR(50), @Email NVARCHAR(50) ,@Password NVARCHAR(2000), @IsBlocked BIT , @IsAdmin BIT)
AS
BEGIN

INSERT INTO Users 
("Name_U", "Email_U", "Password_U", "IsBlocked_U", "Admin_U") 
VALUES 
(@Name, @Email, @Password, @IsBlocked, @IsAdmin)

END

GO
CREATE PROCEDURE UpdateUser (@UpdateUserId INT,@Name NVARCHAR(50), @Email NVARCHAR(50) , @Password NVARCHAR(2000), @IsBlocked BIT, @IsAdmin BIT)  
AS
BEGIN

UPDATE Users SET "Name_U" = @Name, "Email_U" = @Email, "Password_U" = @Password, "IsBlocked_U" = @IsBlocked, "Admin_U" = @IsAdmin
WHERE ID = @UpdateUserId

END

GO
CREATE PROCEDURE DeleteUser (@DeleteUserId INT)  
AS
BEGIN

DELETE FROM Users
WHERE ID = @DeleteUserId

END

