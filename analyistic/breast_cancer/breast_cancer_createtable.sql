-- SQLite
-- SELECT * FROM data_target_table
-- GROUP BY target;

-- SELECT avg(meanradius) FROM data_target_table; 
-- SELECT avg(meantexture) FROM data_target_table; 
-- SELECT avg(meanperimeter) FROM data_target_table; 
-- SELECT avg(meanarea) FROM data_target_table; 
-- SELECT avg(meansmoothness) FROM data_target_table; 
-- SELECT avg(meancompactness) FROM data_target_table; 
-- SELECT avg(meanconcavity) FROM data_target_table; 
-- SELECT avg(meanconcavepoints) FROM data_target_table; 
-- SELECT avg(meansymmetry) FROM data_target_table; 
-- SELECT avg(meanfractaldimension) FROM data_target_table; 



-- CREATE TABLE groupbytarget (
-- meanradius REAL NOT NULL, 
-- meantexture REAL NOT NULL, 
-- meanperimeter REAL NOT NULL, 
-- meanarea REAL NOT NULL, 
-- meansmoothness REAL NOT NULL, 
-- meancompactness REAL NOT NULL, 
-- meanconcavity REAL NOT NULL, 
-- meanconcavepoints REAL NOT NULL, 
-- meansymmetry REAL NOT NULL, 
-- meanfractaldimension REAL NOT NULL,
-- radiuserror REAL NOT NULL, 
-- textureerror REAL NOT NULL, 
-- perimetererror REAL NOT NULL, 
-- areaerror REAL NOT NULL, 
-- smoothnesserror REAL NOT NULL, 
-- compactnesserror REAL NOT NULL, 
-- concavityerror REAL NOT NULL, 
-- concavepointserror REAL NOT NULL, 
-- symmetryerror REAL NOT NULL, 
-- fractaldimensionerror REAL NOT NULL,                                                 
-- worstradius REAL NOT NULL, 
-- worsttexture REAL NOT NULL, 
-- worstperimeter REAL NOT NULL, 
-- worstarea REAL NOT NULL, 
-- worstsmoothness REAL NOT NULL, 
-- worstcompactness REAL NOT NULL, 
-- worstconcavity REAL NOT NULL, 
-- worstconcavepoints REAL NOT NULL, 
-- worstsymmetry REAL NOT NULL, 
-- worstfractaldimension REAL NOT NULL,
-- target REAL NOT NULL
-- );/



INSERT INTO groupbytarget
SELECT 
avg(meanradius), avg(meantexture), avg(meanperimeter), avg(meanarea), avg(meansmoothness), avg(meancompactness), avg(meanconcavity), avg(meanconcavepoints), avg(meansymmetry), avg(meanfractaldimension),
avg(radiuserror), avg(textureerror), avg(perimetererror), avg(areaerror), avg(smoothnesserror), avg(compactnesserror), avg(concavityerror), avg(concavepointserror), avg(symmetryerror), avg(fractaldimensionerror),                                                 
max(worstradius), max(worsttexture), max(worstperimeter), max(worstarea), max(worstsmoothness), max(worstcompactness), max(worstconcavity), max(worstconcavepoints), max(worstsymmetry), max(worstfractaldimension),
target
FROM data_target_table
GROUP BY target;
