#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

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

exit;
EOF