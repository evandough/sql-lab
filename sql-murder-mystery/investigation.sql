-- We know the murder happened in SQL City on 01/15/2018, we ran this query: 
SELECT *
  FROM crime_scene_report
  WHERE type = 'murder'
  AND city = 'SQL City'
  AND date = '20180115'
