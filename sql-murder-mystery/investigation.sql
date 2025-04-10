-- Step 1 
-- We know the murder happened in SQL City on 01/15/2018, we ran this query: 
SELECT *
  FROM crime_scene_report
  WHERE type = 'murder'
  AND city = 'SQL City'
  AND date = '20180115'

-- we received this information:
-- Security footage shows that there were 2 witnesses 
-- The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- Step 2
-- Looked for the first witness on "Northwestern Dr"  
SELECT *
  FROM person
  WHERE address_street_name = 'Northwestern Dr'
  ORDER BY address_number DESC
  LIMIT 1
-- Found the second witness somewhere on "Franklin Ave"
SELECT *
  FROM person
  WHERE address_street_name = 'Franklin Ave'
  AND name LIKE '%Ann%' -- The % is a catch all before and after 'Ann'
  LIMIT 20
