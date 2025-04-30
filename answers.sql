--Question 1: Normalize the following table to 1NF.
-- Step 1: Create a new table that will be in 1NF
create table ProductDetails_1NF(
    OrderID int,
    CustomerName varchar(255),
    ProductName varchar(255),
    primary key (OrderID, ProductName)
);

-- Step 2: Insert the normalized data by splitting the comma-separated values
-- For OrderID 101: John Doe with products Laptop and Mouse
insert into ProductDetails_1NF (OrderID, CustomerName, ProductName) values
(1, "John Doe", "Laptop"),
(1, "John Doe", "Mouse");

-- For OrderID 102: Jane Smith with products Tablet, Keyboard, and Mouse
insert into ProductDetails_1NF (OrderID, CustomerName, ProductName) values
(2, "Jane Smith", "Tablet"),
(2, "Jane Smith", "Keyboard"),
(2, "Jane Smith", "Mouse");

-- For OrderID 103: Emily Clark with product Phone
insert into ProductDetails_1NF (OrderID, CustomerName, ProductName) values
(3, "Emily Clark", "Phone");

--Question 2: Normalize the following table to 2NF.

-- Step 1: Create a new table that will be in 2NF
-- The table will be split into two: Orders_2NF and OrderIteams
create table Orders_2NF(
    OrderID int primary,
    CustomerName varchar(255)
);

-- Step 2: Create the OrderItems table to store product details for each order
-- This will handle the many-to-many relationship between orders and products
create table OrderIteams (
    OrderID int,
    ProductName varchar(255),
    Quantity INT,
    primary key (OrderID, ProductName),
    foreign key (OrderID) references Orders_2NF(OrderID)
);

-- Step 1: Insert the data into Orders_2NF
insert into Orders_2NF (OrderID, CustomerName) values
(101, "John Doe"),
(102, "Jane Smith"),
(103, "Emily Clark");

-- Insert the product details into the OrderIteams table
insert into OrderIteams (OrderID, ProductName) values
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);