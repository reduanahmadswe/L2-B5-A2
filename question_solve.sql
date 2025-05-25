
--Problem 1 
INSERT into rangers(name,region)
VALUES
('Derek Fox', 'Coastal Plains');


--Problem 2
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings;

--Problem 3
SELECT * FROM sightings WHERE location like '%Pass%';


--Problem 4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.ranger_id, r.name
ORDER BY r.name ASC;



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
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;


--problem 9
delete from rangers WHERE ranger_id NOT in (SELECT DISTINCT ranger_id FROM sightings);