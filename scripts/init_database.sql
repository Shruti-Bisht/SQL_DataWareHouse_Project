/*
====================================================================================================================
Create Database and Schema 
====================================================================================================================
Script purpous : this script create a new database " DatawareHouse" 
alse check if it already exist , if yes then database is droped and recreade . 
along with that 3 schemas are created name : Bronze , Silver , Gold ;

Warning : it will drop entire database if it already exists .
*/

-- move to main database to create new database 
use master ;
Go 

if exists (select 1 from sys.database where name = 'DataWareHouse') 
begin 
 drop database DataWareHouse; 
end ;
Go

--create ned data base
Create database DataWareHouse; 
Go

--switch to newly created database 
use DataWareHouse; 
Go 

--create schema
Create Schema Bronze;
Go
Create Schema Silver ;
Go
Create Schema Gold ;
Go

