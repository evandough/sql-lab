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

-- Step 3
-- We have the two witnesses, now we need to view their interviews
SELECT *
  FROM interview
  WHERE person_id IN (14887,16371) -- this query grabs both 'person_id' to view 

-- Step 4
-- Now that we have both interviews, we used the details to further investigate. This following query creates table alias' and joins tables to filter more data
SELECT p.*, gfci.*
  FROM drivers_license as dl -- this query grabs the 'drivers_license' table and creates the alias 'dl'
  INNER JOIN person as p on dl.id = p.license_id -- the SQL Schema diagram, this joins the 'person' table onto the 'drivers_license' table
  INNER JOIN get_fit_now_member as gf on p.id = gf.person_id -- this query creates the alias 'gf' and joins it to the 'person' table
  INNER JOIN get_fit_now_check_in as gfci on gf.id = gfci.membership_id -- this query creates the alias 'gf' and joins it to the 'person' table
  WHERE plate_number LIKE '%H42W%'
  AND membership_status = 'gold'
  AND check_in_date = 20180109
  LIMIT 20  

-- Step 5
-- We found the murderer...but wait, THERE'S MORE! Someone was behind it all. Let's dig deeper and find the murderer's confession. 
SELECT *
  FROM interview
  WHERE person_id = '67318'
  LIMIT 10

-- Step 6 
-- Confession found, more clues found, let's investigate
SELECT *
  FROM drivers_license
  WHERE car_make LIKE '%Tesla%'
  AND car_model = 'Model S'
  LIMIT 10

-- We found a few matches, let's combine tables to filter out the possible suspects
SELECT *
  FROM drivers_license
  INNER JOIN person on drivers_license.id = person.license_id
  INNER JOIN facebook_event_checkin on facebook_event_checkin.person_id = person.id
  WHERE car_make LIKE 'Tesla'
  AND car_model = 'Model S'
  AND hair_color = 'red'
  AND gender = 'female'
  LIMIT 100

-- BOOM! SQL City is safe again 
