/*Queries that provide answers to the questions from all projects.*/

--  project0

select * from animals where name like '%mon';

select name from animals where 
    date_of_birth >= '2016-01-01'
    and date_of_birth < '2019-12-31';

select name from animals where
    neutered = true
    and escape_attempts < 3;

select date_of_birth from animals where
    name in ('Agumon', 'Pikachu');

select name, escape_attempts from animals where
    weight_kg > 10.5;

select * from animals where
    neutered = true;

select * from animals where
    name != 'Gabumon';

select * from animals where
    weight_kg >= 10.4
    and weight_kg <= 17.3;

--  project1

begin;
savepoint sp0;
update animals
set species = 'unspecified';
select * from animals;
rollback to sp0;

begin;
update animals
set species = 'digimon'
where name like '%mon';
update animals
set species = 'pokemon'
where species is null;
commit;
select * from animals;

begin;
delete from animals;
rollback;
select * from animals;

begin;
delete from animals
where date_of_birth > '2022-01-01';
savepoint sp0;
update animals
set weight_kg = weight_kg * (-1);
rollback to sp0;
update animals
set weight_kg = weight_kg * (-1)
where weight_kg < 0;
commit;
select * from animals;