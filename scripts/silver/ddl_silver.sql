/*
=================================================================================================================================
DDL Script : Create Silver layer 
=================================================================================================================================
Script Purpous : This script create table in the Silver layer drops the table if it already exist .
=================================================================================================================================
*/ 

IF OBJECT_ID('Silver.crm_cust_info','U') IS NOT NULL
	DROP TABLE Silver.crm_cust_info;
	Go
Create Table Silver.crm_cust_info(
	cst_id INT ,
	cst_key VARCHAR(20),
	cst_firstname VARCHAR(20),
	cst_lastname VARCHAR(20),
	cst_marital_status VARCHAR(20),
	cst_gndr VARCHAR(10),
	cst_create_date DATE,
    dwh_creation_date DATETIME2 default Getdate()
);
Go

IF OBJECT_ID('Silver.crm_prd_info','U') IS NOT NULL
	DROP TABLE Silver.crm_prd_info;
	Go
CREATE TABLE Silver.crm_prd_info(
	prd_id	INT ,
cat_id VARCHAR(20),
	prd_key	VARCHAR(20),
	prd_nm	VARCHAR(50),
	prd_cost INT,
	prd_line VARCHAR(20),
	prd_start_dt DATE,
	prd_end_dt DATE,
    dwh_creation_date DATETIME2 default Getdate()
);
Go

IF OBJECT_ID('Silver.crm_sales_details','U') IS NOT NULL
	DROP TABLE Silver.crm_sales_details;
	Go
CREATE TABLE Silver.crm_sales_details(
	sls_ord_num VARCHAR(50),
	sls_prd_key	VARCHAR(50),
	sls_cust_id INT,
	sls_order_dt DATE,
	sls_ship_dt	DATE,
	sls_due_dt DATE, 
	sls_sales INT,
	sls_quantity INT, 
	sls_price INT,
    dwh_creation_date DATETIME2 default Getdate()
);
GO

IF OBJECT_ID('Silver.erp_CUST_AZ12','U') IS NOT NULL
	DROP TABLE Silver.erp_CUST_AZ12;
	Go
CREATE TABLE Silver.erp_CUST_AZ12(
	CID NVARCHAR(50),
	BDATE DATE,
	GEN VARCHAR(10),
    dwh_creation_date DATETIME2 default Getdate()
);
Go

IF OBJECT_ID('Silver.erp_LOC_A101','U') IS NOT NULL
	DROP TABLE Silver.erp_LOC_A101;
	Go
CREATE TABLE Silver.erp_LOC_A101(
	CID	NVARCHAR(50),
	CNTRY NVARCHAR(50),
    dwh_creation_date DATETIME2 default Getdate()
);
Go

IF OBJECT_ID('Silver.erp_PX_CAT_G1V2','U') IS NOT NULL
	DROP TABLE Silver.erp_PX_CAT_G1V2;
	Go
CREATE TABLE Silver.erp_PX_CAT_G1V2(
	ID NVARCHAR(50),
	CAT NVARCHAR(50),	
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50),
    dwh_creation_date DATETIME2 default Getdate()
);

Go
