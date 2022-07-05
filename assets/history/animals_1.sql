-- alter table animals
-- add column species text;

-- insert into 
--     animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
-- VALUES
--     ('Charmander', '2020-02-08', 0, false, 11.00),
--     ('Plantmon', '2021-11-15', 2, true, 5.70),
--     ('Squirtle', '1993-04-02', 3, false, 12.13),
--     ('Angemon', '2005-06-12', 1, true, 45.00),
--     ('Boarmon', '2005-06-07', 7, true, 20.40),
--     ('Blossom', '1998-10-13', 3, true, 17.00),
--     ('Ditto', '2022-05-14', 4, true, 22.00);

-- begin;
-- savepoint sp0;
-- update animals
-- set species = 'unspecified';
-- select * from animals;
-- rollback to sp0;

-- begin;
-- update animals
-- set species = 'digimon'
-- where name like '%mon';
-- update animals
-- set species = 'pokemon'
-- where species is null;
-- commit;
-- select * from animals;

-- begin;
-- delete from animals;
-- rollback;
-- select * from animals;

-- begin;
-- delete from animals
-- where date_of_birth > '2022-01-01';
-- savepoint sp0;
-- update animals
-- set weight_kg = weight_kg * (-1);
-- rollback to sp0;
-- update animals
-- set weight_kg = weight_kg * (-1)
-- where weight_kg < 0;
-- commit;
-- select * from animals;

-- select count(*) from animals;

-- select count(*) from animals
-- where escape_attempts = 0;

-- select avg(weight_kg) from animals;


-- -- where 

-- select count(neutered), neutered from animals
-- group by neutered;

-- select neutered from (
--     select count(neutered) as counted, neutered from animals
--     group by neutered
-- ) as neuters
-- where counted = (
--     select max(counted) from (
--         select count(neutered) as counted, neutered from animals
--         group by neutered
--     ) as neuters
-- );

-- select max(weight_kg), min(weight_kg), species from animals
-- group by species;

-- select avg(escape_attempts), species from animals
-- where date_of_birth < '2000-01-01'
-- and date_of_birth > '1990-12-31'
-- group by species;

-- select avg(escape_attempts) as average, species from animals
-- where date_of_birth < '2000-01-01'
-- and date_of_birth > '1990-12-31'
-- group by species;