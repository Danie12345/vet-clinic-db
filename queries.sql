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
select * from animals;

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

select count(*) from animals;

select count(*) from animals
where escape_attempts = 0;

select avg(weight_kg) from animals;

select neutered from (
    select count(neutered) as counted, neutered from animals
    group by neutered
) as neuters
where counted = (
    select max(counted) from (
        select count(neutered) as counted, neutered from animals
        group by neutered
    ) as neuters
);

select max(weight_kg), min(weight_kg), species from animals
group by species;

select avg(escape_attempts) as average, species from animals
where date_of_birth < '2000-01-01'
and date_of_birth > '1990-12-31'
group by species;

-- project2

select name from animals
join owners
    on animals.owners_id = (
        select id from owners
        where full_name = 'Melody Pond'
    )
group by name;

select animals.name from animals
join species
    on animals.species_id = (
        select id from species
        where name = 'Pokemon'
    )
group by animals.name;

select o.full_name as owner, a.name as pet from owners o
full join animals a
    on a.owners_id = o.id;

select c.species, count(c.species) from (
    select s.name as species, a.name as animal from species s
    full join animals a
        on a.species_id = s.id
) as c
group by c.species;

select pet from (
    select o.full_name as owner, a.name as pet, s.name as species from owners o
    join animals a
        on a.owners_id = o.id
    join species s
        on a.species_id = s.id
) as foo
where owner = 'Jennifer Orwell' and species = 'Digimon';

select pet from (
    select o.full_name as owner, a.name as pet, a.escape_attempts as escapes from owners o
    join animals a
        on a.owners_id = o.id
) as foo
where owner = 'Dean Winchester' and escapes = 0;

select owner, count(*) as "pets count" from (
    select count(o.full_name), o.full_name as owner, a.name as pet from owners o
    full join animals a
        on a.owners_id = o.id
    group by owner, pet
) as f
group by owner
order by "pets count" desc
limit 1;

-- project3

select name from animals
where id = (
    select animals_id from visits v
    where v.vets_id = (
        select id from vets
        where name = 'William Tatcher'
    )
    order by v.date_of_visit desc
    limit 1
);

select count(*) as "total animals" from (
    select animals_id from visits v
    where v.vets_id = (
        select id from vets
        where name = 'Stephanie Mendez'
    )
    group by animals_id
) as total;

select v.name as "vet name", s.name as "specialties" from vets v
left join specializations sp
    on v.id = sp.vets_id
left join species s
    on s.id = sp.species_id;

select a.name as "animal", vi.date_of_visit as "visit on" from visits vi
join animals a
    on a.id = vi.animals_id
where
    vi.date_of_visit > '2020-04-01' 
    and vi.date_of_visit < '2020-08-30'
    and vi.vets_id = (select ve.id from vets ve where ve.name = 'Stephanie Mendez');