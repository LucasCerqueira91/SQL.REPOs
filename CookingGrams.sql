USE CookingGrams
DROP TABLE Difficulty Recipe_Favorite

CREATE TABLE Categories (
ID INT PRIMARY KEY IDENTITY,
Title_C NVARCHAR (50) NOT NULL,
FkRecipe_ID INT NOT NULL);

CREATE TABLE Difficulty(
ID INT PRIMARY KEY IDENTITY,
Name_Dificulty NVARCHAR (15) NOT NULL CHECK (Name_Dificulty IN('Easy','EASY','easy','Facil','FACIL','facil',
'medium''MEDIUM', 'Medium', 'medio''MEDIO', 'Medio',
'hard','HARD','Hard', 'dificil','DIFICIL', 'Dificil')), 
FkRecipe_ID INT NOT NULL,
FkCategory_ID INT NOT NULL); 

CREATE TABLE Ingredients (
ID INT PRIMARY KEY IDENTITY,
Name_I NVARCHAR (50));

CREATE TABLE Ingredients_Description(
ID INT PRIMARY KEY IDENTITY,
Description_IDesc NVARCHAR (50) NOT NULL,
Quantity_Gr INT NOT NULL,
FKIngredient_ID INT NOT NULL,
FkRecipes_Ingredient_ID INT NOT NULL);  

CREATE TABLE Ratings (
ID INT PRIMARY KEY IDENTITY,
Rating_U NCHAR (1) NOT NULL,
Comment_U NVARCHAR(100) NULL,
FkUser_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL);

CREATE TABLE Recipes_Favorite(
ID INT PRIMARY KEY IDENTITY,
FkUser_ID INT NOT NULL,
FkRecipe_ID INT NOT NULL,
FkCategory_ID INT NOT NULL);

CREATE TABLE Recipes_Ingredients (
ID INT PRIMARY KEY IDENTITY,
FkRecipe_ID INT NOT NULL);

CREATE TABLE Recipes (
ID INT PRIMARY KEY IDENTITY,
Title_R NVARCHAR (100) NOT NULL,
Description_R NVARCHAR(200) NOT NULL,
PreparationMethod_R NVARCHAR(200) NOT NULL,
PreparationTime NVARCHAR(50) NOT NULL,
FkUser_ID INT NOT NULL,
FkCategory_ID INT NOT NULL);

CREATE TABLE Users (
ID INT PRIMARY KEY IDENTITY,
Name_U NVARCHAR (50) NOT NULL,
Email_U NVARCHAR(50) NOT NULL,
Password_U NVARCHAR(2000) NOT NULL,
IsBlocked_U NCHAR (1) NOT NULL,
Admin_U NCHAR(1) NOT NULL);

CREATE TABLE Unit_Measurement(
ID INT PRIMARY KEY IDENTITY,
Name_Unit NVARCHAR (15) NOT NULL CHECK (Name_Unit IN('Kg','Ml','Gr','Lts')));

Ingredients_Description,FKIngredient_ID,FkRecipes_Ingredient_ID
ALTER TABLE Ingredients_Description ADD CONSTRAINT FkRecipes_Ingredient_ID_Ingredient_Description
FOREIGN KEY (FkRecipes_Ingredient_ID) REFERENCES Ingredients(ID);

ALTER TABLE Ingredients_Description ADD CONSTRAINT FKUnit_Measurement_ID_Ingredient_Description
FOREIGN KEY (FKUnit_Measurement) REFERENCES Unit_Measurement(ID);

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

ALTER TABLE Recipes ADD CONSTRAINT Category_ID_Recipes
FOREIGN KEY (FkCategory_ID) REFERENCES Categories(ID);

ALTER TABLE Recipes ADD Difficulty INT NOT NULL

ALTER TABLE Ingredients_Description ADD FKUnit_Measurement INT NOT NULL;

ALTER TABLE Categories ADD CONSTRAINT Categories_ID_Recipes
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Recipes_ID_Recipes_Ingredients
FOREIGN KEY (FkRecipe_ID) REFERENCES Recipes(ID);

ALTER TABLE Recipes_Ingredients ADD CONSTRAINT Ingredients_ID_Recipes_Ingredients
FOREIGN KEY (FkIngredient_ID) REFERENCES Ingredients(ID);

ALTER TABLE Recipes ADD CONSTRAINT Recipes_ID_Users
FOREIGN KEY (FkUser_ID) REFERENCES Users(ID);

  
