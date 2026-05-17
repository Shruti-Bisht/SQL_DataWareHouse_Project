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


-- to avoid duplicated each time you run this code use truncate first 

CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
	Declare @Start_time DATETIME , @End_time Datetime, @start_time_totl Datetime , @end_time_totl Datetime;
	Begin Try
		PRINT'=============================================================================================';
		PRINT' Loading Bronze Layer ';
		PRINT'=============================================================================================';
		Print'------------------------------------------------------------------------------------------------';
		Print'Load CRM table'
		Print'------------------------------------------------------------------------------------------------';
		Set @start_time_totl=GETDATE();
		Set @Start_time=getDate();
		Print'>> Truncate Table : Bronze.crm_cust_info';
		TRUNCATE TABLE Bronze.crm_cust_info;

		Print'>> Insert data into : Bronze.crm_cust_info';
		BULK INSERT Bronze.crm_cust_info
			FROM 'C:\Users\LENOVO\Desktop\sql-ultimate-course\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
			with(
			 FIRSTROW = 2 , 
			 FIELDTERMINATOR = ',' , 
			 TABLOCK
			 );
		set @End_time=getDate();
		Print'>> Load Duration : '+ Cast(DATEDIFF(Second,@Start_time , @End_time) as NVarchar)+' second';

		Set @Start_time=getDate();
		Print'>> Truncate Table : Bronze.crm_prd_info';
		TRUNCATE TABLE Bronze.crm_prd_info
		Print'>> Insert data into : Bronze.crm_prd_info';
		BULK INSERT Bronze.crm_prd_info
			FROM 'C:\Users\LENOVO\Desktop\sql-ultimate-course\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
			with(
			 FIRSTROW = 2 , 
			 FIELDTERMINATOR = ',' , 
			 TABLOCK
			 );
        set @End_time=getDate();
		Print'>> Load Duration : '+ Cast(DATEDIFF(Second,@Start_time , @End_time) as NVarchar)+' second';

		Set @Start_time=getDate();
		Print'>> Truncate Table : Bronze.crm_Sales_details';
		TRUNCATE TABLE Bronze.crm_sales_details
		Print'>> Insert data into : Bronze.crm_Sales_details';
		BULK INSERT Bronze.crm_sales_details
			FROM 'C:\Users\LENOVO\Desktop\sql-ultimate-course\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
			with(
			 FIRSTROW = 2 , 
			 FIELDTERMINATOR = ',' , 
			 TABLOCK
			 );
		set @End_time=getDate();
		Print'>> Load Duration : '+ Cast(DATEDIFF(Second,@Start_time , @End_time) as NVarchar)+' second';

		Print '---------------------------------------------------------------------------------------------------------------';
		Print'Load ERP table';
		Print'----------------------------------------------------------------------------------------------------------------';
		
		Set @Start_time=getDate();
		Print'>> Truncate Table : Bronze.erp_CUST_AZ12';
		TRUNCATE TABLE Bronze.erp_CUST_AZ12
		Print'>> Insert data into : Bronze.erp_CUST_AZ12';
		BULK INSERT Bronze.erp_CUST_AZ12
			FROM 'C:\Users\LENOVO\Desktop\sql-ultimate-course\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
			with(
			 FIRSTROW = 2 , 
			 FIELDTERMINATOR = ',' , 
			 TABLOCK
			 );
		set @End_time=getDate();
		Print'>> Load Duration : '+ Cast(DATEDIFF(Second,@Start_time , @End_time) as NVarchar)+' second';


		Set @Start_time=getDate();
		Print'>> Truncate Table : Bronze.erp_LOC_A101';
		TRUNCATE TABLE Bronze.erp_LOC_A101
		Print'>> Insert data into : Bronze.erp_LOC_A101';
		BULK INSERT Bronze.erp_LOC_A101
			FROM 'C:\Users\LENOVO\Desktop\sql-ultimate-course\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
			with(
			 FIRSTROW = 2 , 
			 FIELDTERMINATOR = ',' , 
			 TABLOCK
			 );
		set @End_time=getDate();
        Print'>> Load Duration : '+ Cast(DATEDIFF(Second,@Start_time , @End_time) as NVarchar)+' second';

		Set @Start_time=getDate();
		Print'>> Truncate Table : Bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE Bronze.erp_PX_CAT_G1V2
		Print'>> Insert data into : Bronze.erp_PX_CAT_G1V2';
		BULK INSERT Bronze.erp_PX_CAT_G1V2
			FROM 'C:\Users\LENOVO\Desktop\sql-ultimate-course\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
			with(
			 FIRSTROW = 2 , 
			 FIELDTERMINATOR = ',' , 
			 TABLOCK
			 );
		set @End_time=getDate();
       Print'>> Load Duration : '+ Cast(DATEDIFF(Second,@Start_time , @End_time) as NVarchar)+' second';
	   Set @end_time_totl=GETDATE();

	   Print'>>Total Load Duration : '+ Cast(DATEDIFF(Second,@start_time_totl , @end_time_totl) as NVarchar)+' second';

	End Try 
	Begin Catch 
		print'Error Occure while loading Bronze layer';
		print'Error Message' +Error_Message();
		print'Error code '+Cast(Error_Number() as NVarchar);
	End Catch
END;
