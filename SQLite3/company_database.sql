DROP TABLE IF EXISTS Instructor;

.headers on
.mode column 

CREATE TABLE Instructor (
                             ID                char(5),
                             name           varchar(20),
                             dept_name  varchar(20),
                             salary           numeric(8,2));
insert into instructor (id,name,dept_name,salary) values
('2371M','John',  'Cybersecurity',345.32),
('321M','Mark',  'Full stack',32.32),
('A2133','james',  'Software develop',5050.32);

alter table Instructor add column Height INTEGER(3); 

update instructor set height=188 where id='A2133'; 
 

		update instructor set height=167 where name='Mark';

		Select name,ID,dept_name from instructor where height=188; 
