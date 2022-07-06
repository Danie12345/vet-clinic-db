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