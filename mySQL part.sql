# We changed the table name to "patient_records",
CREATE DATABASE therapy_db;
USE therapy_db;

ALTER TABLE patient_records 
DROP COLUMN patient_id;

# We will now add a "patient_id" column
ALTER TABLE patient_records 
ADD patient_id INT PRIMARY KEY AUTO_INCREMENT FIRST;

# We will now create a new table with the count of the different personalites
DROP TABLE Different_personalities;
CREATE TABLE Different_personalities AS
SELECT personality_type, COUNT(personality_type) AS TOTAL FROM patient_records
GROUP BY personality_type;

# We now create a new table with the average, maximum and minnum character counts of the the different personalities
DROP TABLE personality_characters;
CREATE TABLE personality_characters AS
SELECT personality_type, SUM(LENGTH(cleaned_posts)) AS total_characters,
ROUND(AVG(LENGTH(cleaned_posts)),3) AS average_characters,
MIN(LENGTH(cleaned_posts)) as min_characters,
MAX(LENGTH(cleaned_posts)) as max_characters
FROM patient_records
GROUP BY personality_type;


# We create a table that counts the number of posts where "Introverts" and "Extroverts" used specific buzzwords.
DROP TABLE personality_buzzwords;
CREATE TABLE personality_buzzwords AS
SELECT COUNT(*) AS posts_with_buzzwords, personality_type FROM patient_records
WHERE cleaned_posts LIKE '%happy%' OR 
cleaned_posts LIKE '%happiness%' OR 
cleaned_posts LIKE '%sad%' OR 
cleaned_posts LIKE '%sadness%' OR 
cleaned_posts LIKE '%depressed%'OR 
cleaned_posts LIKE '%depression%' OR 
cleaned_posts LIKE '%help%' OR
cleaned_posts LIKE '%suicide%' OR 
cleaned_posts LIKE '%suicidal%'
GROUP BY personality_type;

# We will now create a table that has the definities of the two personalities
DROP TABLE personality_definitions;
CREATE TABLE personality_definitions (
type_code VARCHAR(1) PRIMARY KEY,
full_name VARCHAR(20),
description VARCHAR (255)
);

INSERT INTO personality_definitions (type_code, full_name, description)
VALUES
('I', 'Introvert', 'Focuses on internal thoughts and feelings'),
('E', 'Extrovert', 'Gains energy from external social interactions');

ALTER TABLE patient_records 
MODIFY COLUMN personality_type CHAR(1);
SELECT * FROM patient_records;

# We want to add a foreign key in order to link the personality_type
# from patient_records with the personality _definitions in our previous table (personality_definitions)
ALTER TABLE patient_records
DROP FOREIGN KEY fk_personality_type;

ALTER TABLE patient_records
ADD CONSTRAINT fk_personality_type
FOREIGN KEY (personality_type) REFERENCES personality_definitions(type_code);

# This query combines patient records with their full personality names, descriptions and cleaned posts
SELECT p.patient_id, d.full_name, d.description, p.cleaned_posts 
FROM patient_records p INNER JOIN personality_definitions d
ON  p.personality_type=d.type_code
ORDER BY p.patient_id ASC
LIMIT 50;

