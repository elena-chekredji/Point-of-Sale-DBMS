# Point of Sale (POS) System for Shopper Drug Marts

## Project Overview

This repository contains the database structure and management system for a Point of Sale (POS) system designed specifically for retail environments like Shopper Drug Marts. The system facilitates product sales, manages inventory, and archives transaction records efficiently. It automates the sales process by allowing cashiers to quickly scan and sell products without the need for manual data entry.

## Features

- **Product Management**: Automatically manage product information including stock levels, pricing, and barcodes.
- **Customer Management**: Track customer purchases and manage customer details, including participation in the PC Optimum Rewards Program.
- **Transaction Processing**: Automate the checkout process, apply discounts, and maintain detailed transaction records.
- **Discounts Application**: Automatically apply relevant discounts during checkout based on predefined rules.
- **Employee Management**: Manage cashier logins and track transactions processed by each employee.
- **Payment Processing**: Support for multiple payment methods and seamless integration with financial systems.

## Database Schema

### Entities

1. **Products**
   - `Product_ID` (PK)
   - `Product_Name`
   - `Price`
   - `Barcode_Number`
   - `Stock`

2. **Discounts**
   - `Product_ID` (FK)
   - `Coupon_Codes`
   - `Discount_ID` (PK)
   - `Sale_%`
   - `Condition`
   - `Expiry_Date`

3. **Transactions**
   - `Transaction_ID` (PK)
   - `Transaction_Date`
   - `Customer_ID` (FK)
   - `Employee_ID` (FK)
   - `Product_IDs` (FK)
   - `Method_of_Payment`
   - `Total_Price`
   - `Transaction_Status`

4. **Cashiers**
   - `Employee_ID` (PK)
   - `Name`
   - `Position`

5. **Customers**
   - `Customer_ID` (PK)
   - `Email`
   - `Phone_Number`
   - `PC_Optimum_Number`
   - `Transaction_IDs` (FK)

### Relationships

- **Cashiers** log into the system to process transactions.
- **Transactions** record purchases made by **Customers**, processed by **Cashiers**, and may apply **Discounts** linked to **Products**.


