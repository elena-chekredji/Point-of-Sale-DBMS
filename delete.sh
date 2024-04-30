#!/bin/bash

echo "Enter the table you want to search: "
echo "CUSTOMERS"
echo "EMPLOYEE"
echo "DEPARTMENTS"
echo "DISCOUNTS"
echo "PRODUCTS"
echo "COUPONS"
echo "TRANSACTIONS"
echo "CUSTOMER_RETURNS"
read table

# show columns
sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SELECT column_name
FROM user_tab_cols
WHERE table_name = '$table';
EOF

# search script
echo "Enter the column you want to delete in: "
read column_name

echo "Enter the record you'd like to delete: "
read value

# Execute the SQL script with the search term
sqlplus64 "hbobis/02031980@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
DELETE FROM $table
WHERE &column_name = '$value';
EOF