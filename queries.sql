/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';

select name from animals where 
    date_of_birth >= '2016-01-01'
    and date_of_birth < '2019-12-31';

select name from animals where
    neutered = true
    and escape_attempts < 3;