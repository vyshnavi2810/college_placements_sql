create database college;

use college;

CREATE TABLE campus_placement (
    sl_no INT,
    gender VARCHAR(10),
    ssc_p FLOAT,
    ssc_b VARCHAR(10),
    hsc_p FLOAT,
    hsc_b VARCHAR(10),
    hsc_s VARCHAR(20),
    degree_p FLOAT,
    degree_t VARCHAR(50),
    workex VARCHAR(10),
    etest_p FLOAT,
    specialisation VARCHAR(50),
    mba_p FLOAT,
    status VARCHAR(20),
    salary INT
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/campus_placement.csv'
INTO TABLE campus_placement
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DESCRIBE campus_placement;

SELECT status, COUNT(*) AS total
FROM campus_placement
GROUP BY status;

SELECT gender, status, COUNT(*) AS total
FROM campus_placement
GROUP BY gender, status;

SELECT specialisation, AVG(ssc_p) AS avg_ssc_p, AVG(hsc_p) AS avg_hsc_p, AVG(degree_p) AS avg_degree_p
FROM campus_placement
GROUP BY specialisation;
