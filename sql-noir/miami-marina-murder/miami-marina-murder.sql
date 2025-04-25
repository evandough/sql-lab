-- Step 1
-- Find the crime scene

SELECT *
FROM crime_scene
WHERE location = 'Coral Bay Marina'

-- Data retrieved  
-- id	date	      location	        description
-- 43	19860814	  Coral Bay Marina	The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Step 2
-- We know there were 2 people seen: 
-- 1. one who lives on 300ish "Ocean Drive"
-- 2. another whose first name ends with "ul" and his last name ends with "ez".

SELECT *
FROM person -- the PERSON table we are looking at
WHERE address LIKE "3% Ocean Drive" -- % is a wildcard to look at 3 and then numbers that come after it on Ocean Drive
OR name LIKE "%ul" OR name LIKE "%ez" -- looks for names that end with 'ul' or 'ez'

-- Results 
-- id	name	alias	occupation	address
-- 101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive
-- 102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
