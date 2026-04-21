DROP TABLE IF EXISTS Student; 
.headers on 
.mode column 
CREATE TABLE Student (
    id                INTEGER PRIMARY KEY,
    name              TEXT,
    height            INTEGER,
    location          TEXT,
    school            TEXT,
    date_of_birth     DATE,
    enrollment_status TEXT,
    major             TEXT,
    gpa               NUMERIC,
    advisor_name      TEXT,
    email             TEXT,
    phone_number      TEXT,
    address           TEXT,
    city              TEXT,
    country           TEXT
);
INSERT INTO Student (name, height, location, school, date_of_birth, major, gpa, email) VALUES
('usman', 188, 'istanbul', 'Boston University', '1992-05-15', 'Computer Science', 3.8, 'usman@example.com'),
('faruk', 140, 'cairo', 'United state university', '1992-11-22', 'History', 3.2, 'faruk@example.com'),
('bokky', 120, 'Nigeria','Bose university','2000-01-12','political science',3.7,'bokky@gmail.com'),
('martin', 193, 'Istanbul','Altinbas','2005-07-08','computer engineering',null,'martin@gmail.com'),
('beyza',23,'istanbul ', 'Altinbas university' ,'1996-02-21', 'computer engineering',4.5,'beyzanur@gmail.com'),
('Yusuf',35,'istanbul ', 'Altinbas university' ,'1990-02-21', 'Computer engineering',4.5,'yusuf@gmail.com');


UPDATE Student SET country='United state' WHERE id =1;

UPDATE Student SET country='Morocco' WHERE id =2;
UPDATE Student SET name='Beyza' WHERE id =5; 
UPDATE Student SET country='Turkey'WHERE id =5;


UPDATE Student SET height=183 WHERE id =1; 

UPDATE Student SET school='bosun university' WHERE id =3; 
INSERT INTO Student (name,location,major) values ('john','Egypt','Computer science'); 
SELECT * FROM Student;
