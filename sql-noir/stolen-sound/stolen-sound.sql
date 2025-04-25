-- Step 1
-- Find crime scene information 

SELECT *
FROM crime_scene
WHERE location = 'West Hollywood Records'

-- Results
-- id	  date	    type	  location	                description
-- 65	  19830715	theft	  West Hollywood Records	  A prized vinyl record was stolen from the store during a busy evening.
---------------------------------------------------------------------------------------------------------------------------
-- Step 2
-- Let's find out what the witnesses had to say about the crime 

SELECT *
FROM witnesses
WHERE crime_scene_id = '65'

-- Results
-- id	  crime_scene_id	clue
-- 28	  65	            I saw a man wearing a red bandana rushing out of the store.
-- 75	  65	            The main thing I remember is that he had a distinctive gold watch on his wrist.
---------------------------------------------------------------------------------------------------------------------------
-- Step 3 
-- Let's look at the SUSPECTS table to gather information on them

SELECT *
FROM suspects
WHERE bandana_color = 'red'
AND accessory = 'gold watch'

-- Results
-- id	name	        bandana_color	accessory
-- 35	Tony Ramirez	red	          gold watch
-- 44	Mickey Rivera	red	          gold watch
-- 97	Rico Delgado	red	          gold watch
---------------------------------------------------------------------------------------------------------------------------
-- Step 4 
-- We have the suspects, let's review their interviews
-- WHAT THIS DOES: joins the SUSPECTS table 'id' and the INTERVIEWS table 'suspect_id'

SELECT *
FROM suspects JOIN interviews ON (id=suspect_id)
WHERE suspect_id IN ('35', '44', '97')

-- Results
-- id	name	        bandana_color	accessory	  suspect_id	transcript
-- 35	Tony Ramirez	red	          gold watch	35	        I wasn't anywhere near West Hollywood Records that night.
-- 44	Mickey Rivera	red	          gold watch	44	        I was busy with my music career; I have nothing to do with this theft.
-- 97	Rico Delgado	red	          gold watch	97	        I couldn't help it. I snapped and took the record.
---------------------------------------------------------------------------------------------------------------------------
-- BOOM! We have the culprit and their name is Rico Delgado
