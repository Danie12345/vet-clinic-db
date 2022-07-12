create table patients(
    id int generated by default as identity (start with 1 increment by 1),
    name text not null,
    date_of_birth date not null,
    primary key (id)
);

create table medical_histories(
    id int generated by default as identity (start with 1 increment by 1),    
    admitted_at timestamp not null,
    patient_id int not null,
    status varchar not null,
    primary key (id)
);

create table treatments(
    id int generated by default as identity (start with 1 increment by 1),
    type varchar not null,
    name varchar not null,
    primary key (id)
);