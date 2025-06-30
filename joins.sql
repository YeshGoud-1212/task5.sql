-- Creating Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

-- Creating Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Inserting Data into Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'Delhi'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Hyderabad');

-- Inserting Data into Orders
INSERT INTO Orders VALUES
(101, 1, 'Laptop', 45000.00),
(102, 1, 'Mouse', 500.00),
(103, 2, 'Keyboard', 1200.00),
(104, 5, 'Monitor', 8000.00);  -- Note: No matching customer_id

-- 1. INNER JOIN
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 2. LEFT JOIN
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 3. RIGHT JOIN (if supported)
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 4. FULL OUTER JOIN (use UNION for MySQL/SQLite)
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;
