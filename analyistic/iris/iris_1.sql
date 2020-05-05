-- SQLite

CREATE TABLE groupbytarget_0(
'index' REAL NOT NULL,
sepallength REAL NOT NULL,
sepalwidth REAL NOT NULL,
petallength REAL NOT NULL,
petalwidth REAL NOT NULL,
target REAL NOT NULL);

INSERT INTO groupbytarget_0
SELECT 
count('index'),
avg(sepallength),
avg(sepalwidth),
avg(petallength),
avg(petalwidth),
target
FROM data_target_table
GROUP BY target;
