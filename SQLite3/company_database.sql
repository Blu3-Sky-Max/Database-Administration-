DROP TABLE IF EXISTS Instructor;

.headers on
.mode column 

CREATE TABLE Instructor (
                             ID                char(5),
                             name           varchar(20),
                             dept_name  varchar(20),
                             salary           numeric(8,2));
INSERT INTO Instructor (id,name,dept_name,salary) values
('2371M','John',  'Cybersecurity',345.32),
('321M','Mark',  'Full stack',32.32),
('A2133','james',  'Software develop',5050.32);

ALTER TABLE Instructor ADD COLUMN Height INTEGER(3); 

UPDATE Instructor SET height=188 WHERE id='A2133'; 

SELECT name,ID,dept_name FROM Instructor WHERE height=188; 
