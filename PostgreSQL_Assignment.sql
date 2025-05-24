CREATE DATABASE conservation_db;


CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(80) not null,
    region varchar(100) not null
);


CREATE Table species(
    species_id SERIAL PRIMARY key,
    common_name VARCHAR(80) not null,
    scientific_name VARCHAR(100) not null,
    discovery_date DATE,
    conservation_status varchar(50)
);


create table sightings(
    sighting_id SERIAL PRIMARY key,
    ranger_id int REFERENCES rangers(ranger_id),
    species_id int REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes text
);


INSERT INTO rangers(name, region) 
VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');



INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status) 
VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


--Problem 1 
INSERT into rangers(name,region)
VALUES
('Derek Fox', 'Coastal Plains');


--Problem 2
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings;

--Problem 3
SELECT * FROM sightings WHERE location like '%Pass%';


--Problem 4
SELECT r.name , count(s.sighting_id) as total_sightings
from rangers r
left join sightings s on r.ranger_id = s.ranger_id
GROUP BY r.ranger_id, r.name
ORDER BY total_sightings DESC;



--Problem 5
select s.common_name
from species s
left JOIN sightings si on s.species_id = si.species_id
WHERE si.sighting_id is null;

--problem 6
select sp.common_name , si.sighting_time, r.name from sightings si join species sp on si.species_id = sp.species_id
JOIN rangers r on si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC LIMIT 2;


--problem 7
update species 
SET conservation_status = 'Historic' 
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;


--Problem 8



--problem 9
delete from rangers WHERE ranger_id NOT in (SELECT DISTINCT ranger_id FROM sightings);