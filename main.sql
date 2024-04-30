-- GROUP 13: Create Tables
-- Elena Chekredji 501133464 (Section 12)
-- Hanna Frances Bobis 501021980 (Section 08)
-- Leandro Pascual 500993113 (Section 08)

CREATE TABLE employee(
  Employee_ID NUMBER(6) PRIMARY KEY CHECK (Employee_ID BETWEEN 600000 and 699999) NOT NULL,
  Job_title VARCHAR2(25) NOT NULL,
  Name VARCHAR2(25) NOT NULL
  );
  
CREATE TABLE department(
  Department_Number NUMBER(2, 0) CHECK (Department_Number BETWEEN 1 and 50) PRIMARY KEY,
  Department_Name VARCHAR2(25) NOT NULL
  );

CREATE TABLE products(
  Product_ID NUMBER(4, 0) PRIMARY KEY CHECK (Product_ID BETWEEN 5000 and 5999),
  Product_Name VARCHAR2(25) NOT NULL,
  Barcode_Number NUMBER(12, 0) UNIQUE,
  Price NUMBER(12, 2) NOT NULL,
  Stock NUMBER(8, 0) DEFAULT 0,
  Department_Number NUMBER,
  CONSTRAINT positive_number_check1 CHECK (Price > 0),
  CONSTRAINT positive_number_check2 CHECK (Stock > 0),
  FOREIGN KEY (Department_Number) REFERENCES department(Department_Number)
  );
  
CREATE TABLE discounts(
  Discount_ID NUMBER(4,0) CHECK (Discount_ID BETWEEN 1000 and 1999) PRIMARY KEY,
  Product_ID NUMBER NOT NULL,
  Current_Condition SMALLINT DEFAULT 1 NOT NULL,
  Sale_Percent NUMBER(3,2) CHECK (Sale_Percent BETWEEN 0 and 1),
  Expiry_Date DATE,
  Coupon_Code VARCHAR2(5),
  FOREIGN KEY (Product_ID) REFERENCES products(Product_ID)
);



CREATE TABLE customers(
  Customer_ID NUMBER(4,0) PRIMARY KEY CHECK (Customer_ID BETWEEN 2000 AND 2999),
  Email VARCHAR2(64) UNIQUE,
  Phone_Number VARCHAR2(10) UNIQUE,
  PC_Optimum_Number Number(6, 0) UNIQUE CHECK (PC_Optimum_Number BETWEEN 700000 AND 799999)
);

CREATE TABLE transactions(
  Transaction_ID NUMBER(4, 0) CHECK (Transaction_ID BETWEEN 9000 and 9999) PRIMARY KEY,
  Method_of_Payment VARCHAR2(10) NOT NULL, 
  Transaction_Date DATE NOT NULL,
  Employee_ID NUMBER NOT NULL,
  Transaction_Status SMALLINT DEFAULT 0 NOT NULL,
  Amount NUMBER(12, 2),
  Product_ID NUMBER NOT NULL,
  Customer_ID NUMBER,
  FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID),
  FOREIGN KEY (Product_ID) REFERENCES products(Product_ID),
  FOREIGN KEY (Employee_ID) REFERENCES employee(Employee_ID),
  CONSTRAINT positive_number_check CHECK (amount > 0)
  );

  
  CREATE TABLE customer_returns(
  Return_ID NUMBER(4,0) CHECK (RETURN_ID BETWEEN 3000 and 3999) PRIMARY KEY,
  Resell_Value NUMBER(12,2),
  Product_ID NUMBER NOT NULL,
  Transaction_ID NUMBER NOT NULL,
  Employee_ID NUMBER NOT NULL,
  Customer_ID NUMBER, 
  FOREIGN KEY (Product_ID) REFERENCES products(Product_ID),
  FOREIGN KEY (Transaction_ID) REFERENCES transactions(Transaction_ID),
  FOREIGN KEY (Employee_ID) REFERENCES employee(Employee_ID),
  FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID)
);

-- INSERT Queries
/* Employees */
INSERT INTO employee
VALUES
    (600001, 'Manager', 'Michael Green');

INSERT INTO employee
VALUES
    (600002, 'Assiatant Manager', 'Jane White');

INSERT INTO employee
VALUES
    (600003, 'Sales Representative', 'Robert Campbell');

INSERT INTO employee
VALUES
    (600004, 'Sales Representative', 'Sarah Davis');

INSERT INTO employee
VALUES
    (600005, 'Sales Representative', 'Michael Anderson');

INSERT INTO employee
VALUES
    (600006, 'HR Coordinator', 'Emily Wilson');

INSERT INTO employee
VALUES
    (600007, 'Sales Manager', 'David Jones');

INSERT INTO employee
VALUES
    (600008, 'Cashier', 'Jennifer Miller');

INSERT INTO employee
VALUES
    (600009, 'Cashier', 'James Garcia');

INSERT INTO employee
VALUES
    (600010, 'Cashier', 'Linda Garcia');

/* Department */
INSERT INTO department
VALUES
  (1, 'Medicine');

INSERT INTO department
VALUES
  (5, 'Makeup');

INSERT INTO department
VALUES
  (7, 'Grocery');

INSERT INTO department
VALUES
  (8, 'Personal Care');

INSERT INTO department
VALUES
  (9, 'Home and Electronics');

/* Products*/
INSERT INTO products
VALUES
    (5001, 'Shampoo', 123456789012, 10.99, 100, 8);

INSERT INTO products 
VALUES
    (5002, 'Conditioner', 234567890123, 10.99, 150, 8);

INSERT INTO products 
VALUES
    (5003, 'Lipstick', 345678901234, 7.99, 75, 5);

INSERT INTO products
VALUES
    (5004, 'Mascara', 456789012345, 6.99, 60, 5);

INSERT INTO products 
VALUES
  (5005, 'Cough Syrup', 567890123456, 8.99, 200, 1);

INSERT INTO products 
VALUES
  (5006, 'Advil', 678901234567, 5.99, 250, 1);

INSERT INTO products 
VALUES
    (5007, 'Lettuce', 789012345678, 4.39, 300, 7);

INSERT INTO products 
VALUES
    (5008, 'Baguette', 890123456789, 10.00, 250, 7);

INSERT INTO products 
VALUES
    (5009, 'Nail Polish', 901234567890, 12.55, 200, 8);

INSERT INTO products 
VALUES
    (5010, 'Gum', 123456789000, 19203.00, 450, 7);          

/* Discounts */
INSERT INTO discounts 
VALUES
    (1000, 5001, 1, 0.15, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'SHA15');

INSERT INTO discounts 
VALUES
    (1001, 5002, 1, 0.15, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'CON15');

INSERT INTO discounts 
VALUES
    (1002, 5003, 1, 0.10, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'LIP10');

INSERT INTO discounts 
VALUES
    (1003, 5004, 1, 0.10, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'MAC10');

INSERT INTO discounts 
VALUES
    (1004, 5005, 1, 0.20, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'KOF20');

INSERT INTO discounts 
VALUES
    (1007, 5008, 1, 0.20, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'BAG20');

INSERT INTO discounts 
VALUES
    (1008, 5009, 1, 0.15, TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'NAL15');

/* Customers */
INSERT INTO customers
VALUES
    (2001, 'john.doe@gmail.com', '4161234567', 700001);

INSERT INTO customers
VALUES
    (2002, 'jane.smith@gmail.com', '6472345678', 700123);

INSERT INTO customers
VALUES
    (2003, 'rob.banks@gmail.com', '4163456789', 700002);

INSERT INTO customers
VALUES
    (2004, 'sarah.will@gmail.com', '6474567890', 700003);
    
INSERT INTO customers
VALUES
    (2005, 'michael.brn@gmail.com', '4165678901', 700112);
    
INSERT INTO customers
VALUES
    (2006, 'emily.davis@gmail.com', '6476789012', 700004);
    
INSERT INTO customers
VALUES
    (2007, 'david.wil@gmail.com', '4167890123', 700124);
    
INSERT INTO customers
VALUES
    (2008, 'jen.and@gmail.com', '6478901234', 700005);
    
INSERT INTO customers
VALUES
    (2009, 'james.mart@gmail.com', '4169012345', 700144);
    
INSERT INTO customers
VALUES
    (2010, 'lin.gar@gmail.com', '6470123446', 700006);

INSERT INTO customers
VALUES
    (2011, 'ethan.john@hotmail.com', '6478901987', 700012);
    
INSERT INTO customers
VALUES
    (2012, 'oli.brown@outlook.com', '4169012765', 700145);
    
INSERT INTO customers
VALUES
    (2013, 'mason.wil@hotmail.com', '6470123398', 700056);

INSERT INTO customers
VALUES
    (2014, 'sophi.har@outlook.com', '6470123459', 700093);

/* Transactions */
INSERT INTO transactions
VALUES
    (9001, 'Credit', TO_DATE('2023-05-15', 'YYYY-MM-DD'), 600001, 1, 10.99, 5001, 2001);

INSERT INTO transactions
VALUES
    (9002, 'Cash', TO_DATE('2023-06-20', 'YYYY-MM-DD'), 600002, 1, 10.99, 5002, 2002);

INSERT INTO transactions
VALUES
    (9003, 'Debit', TO_DATE('2023-07-10', 'YYYY-MM-DD'), 600003, 1, 5.99, 5006, 2003);

INSERT INTO transactions 
VALUES
    (9004, 'Credit', TO_DATE('2023-08-05', 'YYYY-MM-DD'), 600004, 1, 6.99, 5004, 2004);

INSERT INTO transactions
VALUES
    (9005, 'Cash', TO_DATE('2023-09-12', 'YYYY-MM-DD'), 600005, 1, 8.99, 5005, 2005);

INSERT INTO transactions 
VALUES
    (9006, 'Debit', TO_DATE('2023-10-03', 'YYYY-MM-DD'), 600006, 1, 10.00, 5008, 2006);

INSERT INTO transactions 
VALUES
    (9007, 'Cash', TO_DATE('2023-11-18', 'YYYY-MM-DD'), 600007, 1, 12.55, 5009, 2007);

INSERT INTO transactions 
VALUES
    (9008, 'Credit', TO_DATE('2023-12-22', 'YYYY-MM-DD'), 600008, 1, 19203.00, 5010, 2008);

INSERT INTO transactions 
VALUES
    (9009, 'Debit', TO_DATE('2024-01-30', 'YYYY-MM-DD'), 600009, 1, 8.99, 5005, 2009);

INSERT INTO transactions 
VALUES
    (9010, 'Cash', TO_DATE('2024-02-05', 'YYYY-MM-DD'), 600010, 1, 7.99, 5003, 2010);

INSERT INTO transactions 
VALUES
    (9011, 'Cash', TO_DATE('2024-02-05', 'YYYY-MM-DD'), 600010, 1, 19203, 5010, 2010);

INSERT INTO transactions 
VALUES
    (90012, 'Debit', TO_DATE('1948-12-30', 'YYYY-MM-DD'), 600009, 1, 8.99, 5005, 2009);


/* Customer Returns */

INSERT INTO customer_returns 
VALUES
    (3001, 25.00, 5001, 9001, 600001, 2001);
    
INSERT INTO customer_returns 
VALUES
    (3002, 10.00, 5002, 9002, 600002, 2002);
    
INSERT INTO customer_returns 
VALUES
    (3003, 20.00, 5006, 9003, 600003, 2003);

INSERT INTO customer_returns 
VALUES
    (3004, 30.00, 5004, 9004, 600004, 2004);
    
INSERT INTO customer_returns 
VALUES
    (3005, 15.00, 5005, 9005, 600005, 2005);


-- SELECT Queries
-- Retrieve all employees with their job titles
SELECT Employee_ID, Job_title, Name FROM employee;

-- Retrieve all departments with their names
SELECT Department_Number, Department_Name FROM department;

-- Get the details of a specific product by its Product_ID
SELECT * FROM products WHERE Product_ID = 5010;

-- Retrieve all discounts with their Product_ID, Sale_Percent, and Expiry_Date
SELECT Discount_ID, Product_ID, Sale_Percent, Expiry_Date FROM discounts;

-- Find all customers who have a PC Optimum Number
SELECT Customer_ID, Email, Phone_Number, PC_Optimum_Number FROM customers WHERE PC_Optimum_Number IS NOT NULL;

-- Find all customers who have made at least one purchase
SELECT DISTINCT Customer_ID FROM transactions;

-- Get all returns ordered by their product IDs
SELECT Product_ID, Return_ID FROM customer_returns ORDER BY Product_ID ASC;

-- Get the amount of products stored in each department
SELECT d.Department_Number, d.Department_Name, COUNT(p.Product_ID) AS Product_Count
FROM department d
LEFT JOIN products p ON d.Department_Number = p.Department_Number
GROUP BY d.Department_Number, d.Department_Name;

/* A4 part 2 */
/* Advanced Join Queries */

-- list all products that were discounted and sold
SELECT d.coupon_code, p.Product_Name, t.transaction_date
FROM products p, discounts d, transactions t 
WHERE p.product_id = d.product_id
  AND d.product_id = t.product_id;


--lists employees who made both the transaction and return on a same product
SELECT e.Employee_ID, e.name, t.Product_ID, t.transaction_id, r.Return_ID
FROM employee e, transactions t, customer_returns r
WHERE e.Employee_ID = t.Employee_ID
  AND t.Employee_ID = r.Employee_ID
  AND t.Product_ID = r.Product_ID;


-- lists the customers which have purchased a specific product and the 
-- employee ID of the employee that made the transaction
SELECT c.Customer_ID, c.Email, e.name, t.Employee_ID
FROM customers c, transactions t, employee e
WHERE t.Product_ID = 5005
AND c.Customer_ID = t.Customer_ID
  AND t.Employee_ID = e.Employee_ID;

/* Views */

-- Creates a view which shows high value tranactions and the 
-- employee which processed that transaction. 
CREATE VIEW high_value_transactions(Amount, Employee_Name) AS
SELECT t.Amount, e.Name 
FROM transactions t, employee e
WHERE Amount >= 400.00
  AND e.Employee_ID = t.Employee_ID;


-- Creates a view of all discounted products
CREATE VIEW discounted_products AS 
SELECT p.Product_Name, d.Sale_Percent
FROM products p
JOIN discounts d ON p.Product_ID = d.Product_ID
  WHERE d.Sale_Percent > 0;


-- Creates a view of all employees and their sales
CREATE VIEW employee_sales AS
SELECT e.employee_id, e.name, t.transaction_id, t.amount
FROM employee e, transactions t
WHERE e.employee_id = t.employee_id;

/* A5 */
-- Give a list of products without discounts
SELECT p.Product_Name
FROM products p
WHERE NOT EXISTS
  (SELECT d.Product_ID 
  FROM discounts d
  WHERE d.Product_ID = p.product_id);

-- Give a list of products purchased that have not been returned
(SELECT t.Transaction_ID 
  FROM transactions t)
MINUS
(SELECT r.Transaction_ID 
  FROM customer_returns r);


-- Give a list of customers who bought from the Medicine or Makeup deparment
SELECT c.Customer_ID, c.Email, c.Phone_Number
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
JOIN products p ON t.Product_ID = p.Product_ID
JOIN department d ON p.Department_Number = d.Department_Number
WHERE d.Department_Name = 'Medicine'
UNION
SELECT c.Customer_ID, c.Email, c.Phone_Number
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
JOIN products p ON t.Product_ID = p.Product_ID
JOIN department d ON p.Department_Number = d.Department_Number
WHERE d.Department_Name = 'Makeup';

-- Get the amount of products stored in each department
SELECT d.Department_Number, d.Department_Name, COUNT(p.Product_ID) AS Product_Count
FROM department d
LEFT JOIN products p ON d.Department_Number = p.Department_Number
GROUP BY d.Department_Number, d.Department_Name;

-- Gets the sum of all the money each customer has spent (more than 7 dollars) in out store
SELECT t.Customer_ID, c.Email, SUM(t.Amount) AS TotalAmount
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
GROUP BY t.Customer_ID, c.Email
HAVING SUM(t.Amount) > 7;