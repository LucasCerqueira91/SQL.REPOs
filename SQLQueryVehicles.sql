  --Create a database named “Vehicles”;
  CREATE DATABASE Vehicles;
   --Create all required tables based on the class structure design;
   --All records to all existing table to allow record collection;

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
Subject_ID INT NOT NULL);
  
  
  --DROP TABLE Moto;
  
  CREATE TABLE Vehicles (
  ID INT PRIMARY KEY IDENTITY (1,1),
  Color_Vhc VARCHAR(40) NOT NULL,
  Year_Vhc INT NOT NULL,
  Price_Vhc MONEY NOT NULL,
  Qantity_Vhc INT NOT NULL,
  Engine_ID INT NOT NULL,
  Brand_ID INT NOT NULL
);

  CREATE TABLE Moto (
  ID INT PRIMARY KEY IDENTITY(1,1),
  Moto_name VARCHAR(40) NOT NULL,
  Engine INT NOT NULL,
  Brand VARCHAR (40) NOT NULL,
  Color_Vhc VARCHAR(40) NOT NULL,
  Year_Vhc INT NOT NULL,
  Price_Vhc MONEY NOT NULL,
  Qantity_Vhc INT NOT NULL
);

  CREATE TABLE Car (
  ID INT PRIMARY KEY IDENTITY(1,1),
  Car_name VARCHAR(40) NOT NULL,
  Engine FLOAT NOT NULL,
  Brand VARCHAR (40) NOT NULL
  Brand VARCHAR (40) NOT NULL,
  Color_Vhc VARCHAR(40) NOT NULL,
  Year_Vhc INT NOT NULL,
  Price_Vhc MONEY NOT NULL,
  Qantity_Vhc INT NOT NULL
);

-- Car
INSERT INTO Car VALUES('Porsche Cayenne');

-- Moto
INSERT INTO Car VALUES('BMW F800');

--The script must display all automobiles in the Database;
SELECT * FROM Car;

--The script must display all motorcycles in the Database;
SELECT * FROM Moto;

--The script must display all automobiles and motorcycles in the Database. Display only the
--common information;
SELECT *
FROM Car
CROSS JOIN Moto 


--The script must display all automobiles and motorcycles in the Database. Display all the
--information even if there is no relation in both tables;
 
SELECT * FROM Car CROSS JOIN Moto; 

--8. The script must display all earth-bound vehicles and related information in the Database.
--This means not to only display the information of the earth-bound vehicles table but all
--directly related (downwards relation). Display only the common information;
--9. The script must display all earth-bound vehicles and related information in the Database.
--This means not to only display the information of the earth-bound vehicles table but all
--directly related (downwards relation). Display all the information that is considered
--relevant;
--10. The script is similar to the previous script but consider all existing types of vehicles;
--11. The script based on the last requested script that receives a string input and searches for
--matching record based on the type of the vehicle;
--12. The script is similar to the previous script but consider and common columns as a possible
--search field;*/








--CREATE DATABASE Vehicles;
 DROP TABLE Moto;
CREATE TABLE Vehicles (
  ID INT PRIMARY KEY IDENTITY (1,1),
  Color_Vhc VARCHAR(40) NOT NULL,
  Year_Vhc INT NOT NULL,
  Price_Vhc MONEY NOT NULL,
  Qantity_Vhc INT NOT NULL,
  Engine_ID INT NOT NULL,
  Brand_ID INT NOT NULL
);

CREATE TABLE Moto (
  ID INT PRIMARY KEY IDENTITY(1,1),
  Moto_name VARCHAR(40) NOT NULL,
  Engine INT NOT NULL,
  Brand VARCHAR (40) NOT NULL,
  Color_Vhc VARCHAR(40) NOT NULL,
  Year_Vhc INT NOT NULL,
  Price_Vhc MONEY NOT NULL,
  Qantity_Vhc INT NOT NULL
);

  CREATE TABLE Car (
  ID INT PRIMARY KEY IDENTITY(1,1),
  Car_name VARCHAR(40) NOT NULL,
  Engine FLOAT NOT NULL,
  Brand VARCHAR (40) NOT NULL
);

--CREATE TABLE Engine (
--Engine_ID INT PRIMARY KEY IDENTITY(1,1),
--Motor_engine FLOAT NOT NULL
);
CREATE TABLE Brand (
Brand_ID INT PRIMARY KEY IDENTITY(1,1),
Brand_name VARCHAR(40) NOT NULL
);

-- Car
INSERT INTO Car VALUES('Porsche Cayenne');

-- Moto
INSERT INTO Car VALUES('BMW F800');

ALTER TABLE Moto
ADD Color_Vhc VARCHAR(40) NOT NULL,
  Year_Vhc INT NOT NULL,
  Price_Vhc MONEY NOT NULL,
  Qantity_Vhc INT NOT NULL;

ALTER TABLE Car
ADD Color_Vhc VARCHAR(40) NOT NULL,
  Year_Vhc INT NOT NULL,
  Price_Vhc MONEY NOT NULL,
  Qantity_Vhc INT NOT NULL;
  
ALTER TABLE Moto
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

SELECT * FROM Moto

-- -----------------------------------------------------------------------------

-- Insert Values
INSERT INTO Moto VALUES('BMW F800', 800 , 'BMW', 'Dark Blue', 2023, 29000, 18);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

--UPDATE Table_Name SET Column_Name = New_Value WHERE Condition;  
UPDATE Moto SET Color_Vhc = 'Blue' WHERE ID = 4;  

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);
