/* Populate database with sample data. */

--  project0

insert into 
    animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values
    ('Agumon', '2020-02-03', 0, true, 10.23),
    ('Gabumon', '2018-11-15', 2, true, 8.00),
    ('Pikachu', '2021-01-07', 1, false, 15.04),
    ('Devimon', '2017-05-12', 5, true, 11.00);

--  project1

insert into 
    animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values
    ('Charmander', '2020-02-08', 0, false, -11.00),
    ('Plantmon', '2021-11-15', 2, true, -5.70),
    ('Squirtle', '1993-04-02', 3, false, -12.13),
    ('Angemon', '2005-06-12', 1, true, -45.00),
    ('Boarmon', '2005-06-07', 7, true, 20.40),
    ('Blossom', '1998-10-13', 3, true, 17.00),
    ('Ditto', '2022-05-14', 4, true, 22.00);

-- project2

insert into 
    owners (full_name, age)
values
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

insert into
    species (name)
values
    ('Pokemon'),
    ('Digimon');

update animals
set species_id = (
    select id from species
    where name = 'Digimon'
)
where substring(name, position('mon' in name),3) = 'mon'
update animals
set species_id = (
    select id from species
    where name = 'Pokemon'
)
where substring(name, position('mon' in name),3) != 'mon';

update animals
set owners_id = (
    select id from owners
    where full_name = 'Sam Smith'
)
where name = 'Agumon';
update animals
set owners_id = (
    select id from owners
    where full_name = 'Jennifer Orwell'
)
where name in ('Gabumon', 'Pikachu');
update animals
set owners_id = (
    select id from owners
    where full_name = 'Bob'
)
where name in ('Devimon', 'Plantmon');
update animals
set owners_id = (
    select id from owners
    where full_name = 'Melody Pond'
)
where name in ('Charmander', 'Squirtle', 'Blossom');
update animals
set owners_id = (
    select id from owners
    where full_name = 'Dean Winchester'
)
where name in ('Angemon', 'Boarmon');

-- project3

insert into 
    vets (name, age, date_of_graduation)
values
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

insert into 
    specializations (species_id, vets_id)
select s.id as species_id , v.id as vets_id from vets v
join species s
on v.name = 'William Tatcher' and s.name = 'Pokemon';
insert into 
    specializations (species_id, vets_id)
select s.id as species_id , v.id as vets_id from vets v
join species s
on v.name = 'Stephanie Mendez' and s.name in ('Pokemon', 'Digimon');
insert into 
    specializations (species_id, vets_id)
select s.id as species_id , v.id as vets_id from vets v
join species s
on v.name = 'Jack Harkness' and s.name = 'Digimon';

insert into 
    visits (animals_id, vets_id, date_of_visit)
values
    (
        (select a.id from animals a where a.name = 'Agumon'),
        (select v.id from vets v where v.name = 'William Tatcher'),
        '2020-05-24'
    ),
    (
        (select a.id from animals a where a.name = 'Agumon'),
        (select v.id from vets v where v.name = 'Stephanie Mendez'),
        '2020-07-22'
    ),
    (
        (select a.id from animals a where a.name = 'Gabumon'),
        (select v.id from vets v where v.name = 'Jack Harkness'),
        '2021-02-02'
    ),
    (
        (select a.id from animals a where a.name = 'Pikachu'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2020-01-05'
    ),
    (
        (select a.id from animals a where a.name = 'Pikachu'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2020-03-08'
    ),
    (
        (select a.id from animals a where a.name = 'Pikachu'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2020-05-14'
    ),
    (
        (select a.id from animals a where a.name = 'Devimon'),
        (select v.id from vets v where v.name = 'Stephanie Mendez'),
        '2021-05-04'
    ),
    (
        (select a.id from animals a where a.name = 'Charmander'),
        (select v.id from vets v where v.name = 'Jack Harkness'),
        '2021-02-24'
    ),
    (
        (select a.id from animals a where a.name = 'Plantmon'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2019-12-21'
    ),
    (
        (select a.id from animals a where a.name = 'Plantmon'),
        (select v.id from vets v where v.name = 'William Tatcher'),
        '2019-12-21'
    ),
    (
        (select a.id from animals a where a.name = 'Plantmon'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2021-04-07'
    ),
    (
        (select a.id from animals a where a.name = 'Squirtle'),
        (select v.id from vets v where v.name = 'Stephanie Mendez'),
        '2019-09-29'
    ),
    (
        (select a.id from animals a where a.name = 'Angemon'),
        (select v.id from vets v where v.name = 'Jack Harkness'),
        '2020-10-03'
    ),
    (
        (select a.id from animals a where a.name = 'Angemon'),
        (select v.id from vets v where v.name = 'Jack Harkness'),
        '2020-11-04'
    ),
    (
        (select a.id from animals a where a.name = 'Boarmon'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2019-01-24'
    ),
    (
        (select a.id from animals a where a.name = 'Boarmon'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2019-05-15'
    ),
    (
        (select a.id from animals a where a.name = 'Boarmon'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2020-02-27'
    ),
    (
        (select a.id from animals a where a.name = 'Boarmon'),
        (select v.id from vets v where v.name = 'Maisy Smith'),
        '2020-08-03'
    ),
    (
        (select a.id from animals a where a.name = 'Blossom'),
        (select v.id from vets v where v.name = 'Stephanie Mendez'),
        '2020-05-24'
    ),
    (
        (select a.id from animals a where a.name = 'Blossom'),
        (select v.id from vets v where v.name = 'William Tatcher'),
        '2021-01-11'
    )