/* Database schema to keep the structure of entire database. */

create table animals(
    id int not null,
    name text not null,
    date_of_birth date not null,
    escape_attempts int not null,
    neutered bool not null,
    weight_kg decimal not null,
    primary key (id)
);
