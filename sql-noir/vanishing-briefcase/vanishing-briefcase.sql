-- Step 1
-- Gather info about the crime scene

SELECT *
FROM crime_scene
WHERE location = 'Blue Note Lounge'

-- Data retrieved  
-- id	  date	    type	  location	          description
-- 76	  19851120	theft	  Blue Note Lounge	  A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Step 2
-- Find the name of trench coat wearing man with a scar on left cheek

SELECT *
FROM suspects
WHERE scar = 'left cheek'
AND attire = 'trench coat'

-- Data retrieve
-- id  	name	            attire	      scar
-- 3	  Frankie Lombardi	trench coat	  left cheek
-- 183	Vincent Malone	  trench coat	  left cheek
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Step 3
-- Find the suspects interviews

SELECT *
FROM interviews
WHERE suspect_id IN (3, 183) -- this grabs both id's 

-- Data retrieved
-- suspect_id	  transcript
-- 3	          NULL
-- 183	        I wasn’t going to steal it, but I did.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- BOOM! Vincent Malone is our culptrit!

