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

