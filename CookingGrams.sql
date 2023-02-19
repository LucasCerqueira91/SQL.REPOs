USE CookingGrams;

DROP DATABASE CookingGrams;
CREATE DATABASE CookingGrams;

CREATE TABLE Users (
ID INT PRIMARY KEY IDENTITY,
Name_U NVARCHAR (60) NOT NULL,
Email_U NVARCHAR(60) NOT NULL,
Password_U NCHAR(160) NOT NULL,
IsBlocked_U NCHAR (1) NOT NULL,
Admin_U NCHAR(1) NOT NULL);

CREATE TABLE Ratings (
ID INT PRIMARY KEY IDENTITY,
Rating_U NCHAR (1) NOT NULL,
Comment_U NVARCHAR(800) NULL,
FkUser_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL);

ALTER TABLE Ratings ADD CONSTRAINT FkUser_ID_Ratings
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

ALTER TABLE Ratings ADD CONSTRAINT FkRecipe_ID_Ratings
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

CREATE TABLE Categories (
ID INT PRIMARY KEY IDENTITY,
Title_C NVARCHAR (40));

CREATE TABLE Recipes (
ID INT PRIMARY KEY IDENTITY,
Title_R NVARCHAR (100) NOT NULL,
Description_R NVARCHAR(max) NOT NULL,
PreparationMethod_R NTEXT NOT NULL,
Dificulty_R NVARCHAR (15) NOT NULL,
  
  
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------
  USE CookingGrams;
USE Vehicles;
DROP DATABASE CookingGrams;
CREATE DATABASE CookingGrams;
DROP DATABASE Scheduler

DROP TABLE Users, Ratings, Categories

CREATE TABLE Users (
ID INT PRIMARY KEY IDENTITY,
Name_U NVARCHAR (60) NOT NULL,
Email_U NVARCHAR(60) NOT NULL,
Password_U NVARCHAR(100) NOT NULL,
IsBlocked_U NCHAR (1) NOT NULL,
Admin_U NCHAR(1) NOT NULL);

CREATE TABLE Ratings (
ID INT PRIMARY KEY IDENTITY,
Rating_U NCHAR (1) NOT NULL,
Comment_U NVARCHAR(800) NULL,
FkUser_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL);

ALTER TABLE Ratings ADD CONSTRAINT FkUser_ID_Ratings
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

ALTER TABLE Ratings ADD CONSTRAINT FkRecipe_ID_Ratings
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

CREATE TABLE Categories (
ID INT PRIMARY KEY IDENTITY,
Title_C NVARCHAR (40));

CREATE TABLE Recipes (
ID INT PRIMARY KEY IDENTITY,
Title_R NVARCHAR (100) NOT NULL,
Description_R NVARCHAR(max) NOT NULL,
PreparationMethod_R NTEXT NOT NULL,
Dificulty_R NVARCHAR (15) NOT NULL,
--Dificulty_R NVARCHAR (15) NOT NULL CHECK (Dificulty_R IN('Very Easy', 'Easy', 'Medium', 'Hard', 'Very Hard')), (OPTION WITH ENUMS)
FkCategory_ID INT NOT NULL,
PreparationTime NVARCHAR(40) NOT NULL);

CREATE TABLE Favorite_Recipe (
ID INT PRIMARY KEY IDENTITY,
FkUser_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL,
FkCategory_ID INT NOT NULL);


ALTER TABLE Favorite_Recipes ADD CONSTRAINT Favorite_Recipes_ID_Users
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

ALTER TABLE Favorite_Recipes ADD CONSTRAINT Favorite_Recipes_ID_Recipes
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

ALTER TABLE Favorite_Recipes ADD CONSTRAINT Favorite_Recipes_ID_Categories
FOREIGN KEY (FkCategory_ID) REFERENCES Categories(ID);


ALTER TABLE Recipes ADD CONSTRAINT Category_ID_Recipes
FOREIGN KEY (FkCategory_ID) REFERENCES Categories(ID);

CREATE TABLE Recipes_Ingredients (
ID INT PRIMARY KEY IDENTITY,
FkRecipe_ID INT NOT NULL,
FkIngredient_ID INT NOT NULL);

ALTER TABLE Recipes ADD FkUser_ID INT NOT NULL

ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Recipes_ID_Recipes_Ingredients
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Ingredients_ID_Recipes_Ingredients
FOREIGN KEY (FkIngredient_ID) REFERENCES Ingredients(ID);

ALTER TABLE Recipes ADD CONSTRAINT Recipes_ID_Users
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

CREATE TABLE Ingredients (
ID INT PRIMARY KEY IDENTITY,
Title_I NVARCHAR (40) NOT NULL,
Quantity_I NVARCHAR (50) NOT NULL,
Unit_I NVARCHAR (50) NOT NULL,
Description_I NVARCHAR (800));

--Dificulty_R NVARCHAR (15) NOT NULL CHECK (Dificulty_R IN('Very Easy', 'Easy', 'Medium', 'Hard', 'Very Hard')), (OPTION WITH ENUMS)
FkCategory_ID INT NOT NULL,
PreparationTime NVARCHAR(40) NOT NULL);


ALTER TABLE Recipes ADD CONSTRAINT Category_ID_Recipes
FOREIGN KEY (FkCategory_ID) REFERENCES Categories(ID);

CREATE TABLE Recipes_Ingredients (
ID INT PRIMARY KEY IDENTITY,
FkRecipes_ID INT NOT NULL,
FkIngredients_ID INT NOT NULL);


ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Recipes_ID_Recipes_Ingredients
FOREIGN KEY (FkRecipes_ID) REFERENCES Recipes(ID);

ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Ingredients_ID_Recipes_Ingredients
FOREIGN KEY (FkIngredients_ID) REFERENCES Ingredients(ID);

CREATE TABLE Ingredients (
ID INT PRIMARY KEY IDENTITY,
Title_I NVARCHAR (40) NOT NULL,
Quantity_I NVARCHAR (50) NOT NULL,
Unit_I NVARCHAR (50) NOT NULL,
Description_I NVARCHAR (800));

DROP TABLE Ingredients
