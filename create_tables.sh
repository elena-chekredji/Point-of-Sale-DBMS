#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
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

-- Creates a view which shows high value tranactions and the employee which processed that transaction. 
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

exit;
EOF