/* Database schema to keep the structure of entire database. */

--  project0

create table animals(
    id int generated by default as identity (start with 1 increment by 1),
    name text not null,
    date_of_birth date not null,
    escape_attempts int not null,
    neutered bool not null,
    weight_kg decimal not null,
    primary key (id)
);

-- project1

alter table animals
add column species text;

-- project2

create table owners(
    id int generated by default as identity (start with 1 increment by 1),
    full_name text not null,
    age int not null,
    primary key (id)
);

create table species(
    id int generated by default as identity (start with 1 increment by 1),
    name text not null,
    primary key (id)
);

select * from animals
order by id;
alter table animals
drop species;
select * from animals;
alter table animals
    add column species_id int
    references species(id);
alter table animals
    add column owners_id int
    references owners(id);

-- project3

create table vets(
    id int generated by default as identity (start with 1 increment by 1),
    name text not null,
    age int not null,
    date_of_graduation date not null,
    primary key (id)
);

create table specializations(
    species_id int,
    vets_id int
);

create table visits(
    animals_id int not null,
    vets_id int not null,
    date_of_visit date not null
);

-- project4

alter table owners add column email varchar(120);
alter table owners alter column age drop not null;

create index visits_animals_id_hash on visits
(
    animals_id asc
);

create index visits_vets_id_hash on visits
(
    vets_id asc
);

create index owners_email_hash on owners
(
    email asc
);