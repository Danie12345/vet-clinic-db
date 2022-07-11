-- alter table owners add column email varchar(120);

-- INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
-- ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;

-- explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
-- explain analyze SELECT * FROM visits where vets_id = 2;
-- explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

-- create index visits_animals_id_hash on visits
-- (
--     animals_id asc
-- );

-- create index visits_vets_id_hash on visits
-- (
--     vets_id asc
-- );

-- create index owners_email_hash on owners
-- (
--     email asc
-- );