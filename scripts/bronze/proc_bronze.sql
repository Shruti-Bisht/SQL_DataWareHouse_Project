/*
======================================================================================================
Stored Procedure : Load Bronze Layer (Source -> Bronze ) 
======================================================================================================
Script Purpose : 
  This stored procedure loads data into the 'bronze' schema from external CSV files . 
  It performs the following action
  - Truncates the bronze table before loading data . 
  - Uses the 'Bulk Insert ' command to load data from csv files to bronze tables.

Parameters : 
  None . 
This stored procedure does not accept any parameters or return any values.

Usage Example : 
  Exec bronze.load_bronze;
======================================================================================================
*/

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
