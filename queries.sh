#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
MainMenu()
{
  while [ "$CHOICE" != "START" ]
  do
    clear
    echo "================================================================="
    echo "| Query Not Inclusive Tool                                      |"
    echo "| Query Menu - Select Desired Query(s):                         |"
    echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>              |"
    echo "-----------------------------------------------------------------"
    echo " "
    echo " $IS_SELECTED1 1) Discounted Products that were Sold"
    echo " $IS_SELECTED2 2) Employee Selling and Returning Same Product"
    echo " $IS_SELECTED3 3) Products without Discounts"
    echo " $IS_SELECTED4 4) Products that Weren't Returned"
    echo " $IS_SELECTED3 5) Customers that Bought from Medicine or Makeup Department"
    echo " $IS_SELECTED3 6) Products Stored in Each Department"
    echo " $IS_SELECTED3 7) Sum of Each Customer Purchase"
    echo " "
    echo " $IS_SELECTEDE E) Return to Main Menu"
    echo "Choose: "
    read CHOICE
    if [ "$CHOICE" == "0" ]
    then
      echo "Nothing Here"
      
    elif [ "$CHOICE" == "1" ]
    then
      sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)          (Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
      SELECT d.coupon_code, p.Product_Name, t.transaction_date
      FROM products p, discounts d, transactions t 
      WHERE p.product_id = d.product_id
      AND d.product_id = t.product_id;
EOF
      read -p "Press Enter to continue..."
      Pause
      
    elif [ "$CHOICE" == "2" ]
    then
      sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)          (Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
      SELECT e.Employee_ID, e.name, t.Product_ID, t.transaction_id, r.Return_ID
      FROM employee e, transactions t, customer_returns r
      WHERE e.Employee_ID = t.Employee_ID
      AND t.Employee_ID = r.Employee_ID
      AND t.Product_ID = r.Product_ID;
EOF
      read -p "Press Enter to continue..."
      Pause
      
    elif [ "$CHOICE" == "3" ]
    then
      sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)          (Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
      SELECT p.Product_Name
      FROM products p
      WHERE NOT EXISTS
      (SELECT d.Product_ID 
      FROM discounts d
      WHERE d.Product_ID = p.product_id);
EOF
      read -p "Press Enter to continue..."
      Pause
      
    elif [ "$CHOICE" == "4" ]
    then
      sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)          (Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
      (SELECT t.Transaction_ID 
      FROM transactions t)
      MINUS
      (SELECT r.Transaction_ID 
      FROM customer_returns r);
EOF
      read -p "Press Enter to continue..."
      Pause

elif [ "$CHOICE" == "5" ]
    then
      sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)          (Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
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
EOF
      read -p "Press Enter to continue..."
      Pause

elif [ "$CHOICE" == "6" ]
    then
      sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)          (Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
      SELECT d.Department_Number, d.Department_Name, COUNT(p.Product_ID) AS              Product_Count
      FROM department d
      LEFT JOIN products p ON d.Department_Number = p.Department_Number
      GROUP BY d.Department_Number, d.Department_Name;
EOF
      read -p "Press Enter to continue..."
      Pause

elif [ "$CHOICE" == "7" ]
    then
      sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)          (Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
      SELECT t.Customer_ID, c.Email, SUM(t.Amount) AS TotalAmount
      FROM customers c
      JOIN transactions t ON c.Customer_ID = t.Customer_ID
      GROUP BY t.Customer_ID, c.Email
      HAVING SUM(t.Amount) > 7;
EOF
      read -p "Press Enter to continue..."
      Pause
      
    elif [ "$CHOICE" == "E" ]
    then
      exit
    fi
done

}

#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
  StartMessage
  while [ 1 ]
  do
    MainMenu
  done
}

ProgramStart