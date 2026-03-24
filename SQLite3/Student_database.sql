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
('usman', 188, 'istanbul', 'altinbas university', '2001-05-15', 'Computer Science', 3.8, 'usman@example.com'),
('faruk', 140, 'cairo', 'United state university', '2002-11-22', 'History', 3.2, 'faruk@example.com'),
('bokky', 120, 'nigeria','Bose university','2000-01-12','policatal science',3.7,'bokky@gmail.com'),
('martin', 193, 'istanbul','Altinbas','2005-07-08','computer engineering',null,'martin@gmail.com'),
('eyza',23,'istanbul ', 'Altinbas university' ,'1996-02-21', 'computer engineering',4.5,'beyzanur@gmail.com');
update Student set country='United state' where id =1;
update Student set country='Morroco' where id =2;
update Student set name='Beyza' where id =5; 
update Student set country='Turkey'where id =5;


update Student set height=183 where id =1; 

update Student set school='bosun university' where id =3; 
SELECT * FROM Student;
