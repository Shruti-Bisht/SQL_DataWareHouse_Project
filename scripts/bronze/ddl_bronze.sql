/*
=================================================================================================================================
DDL Script : Create Bronze layer 
=================================================================================================================================
Script Purpous : This script create table in the bronze layer drops the table if it already exist .
=================================================================================================================================
*/ 

IF OBJECT_ID('Bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE Bronze.crm_cust_info;
Create Table Bronze.crm_cust_info(
	cst_id INT ,
	cst_key VARCHAR(20),
	cst_firstname VARCHAR(20),
	cst_lastname VARCHAR(20),
	cst_marital_status VARCHAR(20),
	cst_gndr VARCHAR(10),
	cst_create_date DATE
);

IF OBJECT_ID('Bronze.crm_prd_info','U') IS NOT NULL
	DROP TABLE Bronze.crm_prd_info;
CREATE TABLE Bronze.crm_prd_info(
	prd_id	INT ,
	prd_key	VARCHAR(20),
	prd_nm	VARCHAR(50),
	prd_cost INT,
	prd_line VARCHAR(20),
	prd_start_dt DATE,
	prd_end_dt DATE
);

IF OBJECT_ID('Bronze.crm_sales_details','U') IS NOT NULL
	DROP TABLE Bronze.crm_sales_details;
CREATE TABLE Bronze.crm_sales_details(
	sls_ord_num VARCHAR(50),
	sls_prd_key	VARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt	INT,
	sls_due_dt INT, 
	sls_sales INT,
	sls_quantity INT, 
	sls_price INT
);

IF OBJECT_ID('Bronze.erp_CUST_AZ12','U') IS NOT NULL
	DROP TABLE Bronze.erp_CUST_AZ12;
CREATE TABLE Bronze.erp_CUST_AZ12(
	CID NVARCHAR(50),
	BDATE DATE,
	GEN VARCHAR(10)
);

IF OBJECT_ID('Bronze.erp_LOC_A101','U') IS NOT NULL
	DROP TABLE Bronze.erp_LOC_A101;
CREATE TABLE Bronze.erp_LOC_A101(
	CID	NVARCHAR(50),
	CNTRY NVARCHAR(50)
);

IF OBJECT_ID('Bronze.erp_PX_CAT_G1V2','U') IS NOT NULL
	DROP TABLE Bronze.erp_PX_CAT_G1V2;
CREATE TABLE Bronze.erp_PX_CAT_G1V2(
	ID NVARCHAR(50),
	CAT NVARCHAR(50),	
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50)
);


