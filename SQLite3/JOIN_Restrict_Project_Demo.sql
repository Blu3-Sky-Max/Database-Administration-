/* Name: Usman O. Olanrewaju (Blu3-Sky) 
   Date: 2026/04/20
 */

.headers on
.mode column 


Drop TABLE IF EXISTS  Database_exam_2026;
Drop TABLE IF EXISTS  Supervisor;
Create TABLE Database_exam_2026 (
        Room  CHAR (4), 	
	Name TEXT,
	Surname TEXT, 	
	Student_No INTEGER PRIMARY KEY,
	Grade INTEGER,
        Supervisor_Id INTEGER  
); 

INSERT INTO Database_exam_2026 (Name, Surname,  Student_No , Grade, Room,  Supervisor_Id) VALUES 
 ('usman', 'Olanrewaju' , 345223, 100 , 'D505',8893284302 ), 
 ('beyza',  'tmm' , 332103, 95 , 'D605', 8893284310 ),
 ('Bob','frank' , 4323, 40 , 'D505',8893284302 ),
 ('Alice', '' , 343334, 23 , 'D605',8893284310 ),
('Juilet','',  403434, 50 , 'D505',8893284302 ), 
('John','',  423434, 50 , 'D505',8893284302 ),
('half',  'freedom' , 33210320, 65 , 'D505', 8893284302 ),
('thought',  'learning' , 33210307, 15 , 'D505', 8893284302 ),
('beyza',  'surat' , 33212387, 55 , 'D605', 8893284310 )

;

CREATE TABLE Supervisor (
	Name TEXT, 
	Surname TEXT, 
	Date TEXT,
	Supervisor_Id INTEGER PRIMARY KEY
); 




INSERT INTO Supervisor (Name,Surname,Date,Supervisor_Id) VALUES 
 ('Dr.', 'Sefer' , '2026-03-21',  8893284302), 
 ('Dr.', 'Hamed' ,'2026-03-21' ,  8893284310 ),
 ('Dr.', 'Abdullahi' ,'2026-03-21' ,8893284222);


--Getting the combination of the two table

SELECT * FROM Database_exam_2026 JOIN Supervisor  ON  Database_exam_2026.Supervisor_Id = Supervisor.Supervisor_Id; 


--Getting Grade less than equal 50

SELECT * FROM  Database_exam_2026 JOIN  Supervisor ON  Database_exam_2026.supervisor_Id=Supervisor.supervisor_Id WHERE Database_exam_2026.grade <= 50;

-- Getting All Student Sat At D505, has above 50 or equal 50 

SELECT  Database_exam_2026.Grade, Database_exam_2026.Name, Database_exam_2026.Surname,Database_exam_2026.Student_no FROM Database_exam_2026 JOIN  Supervisor ON  Database_exam_2026.Supervisor_Id=Supervisor.Supervisor_Id WHERE  Database_exam_2026.grade >= 50 and Database_exam_2026.room='D505' ; 


------ Getting All Student Sat at D605 
SELECT * FROM Database_exam_2026 JOIN Supervisor on Database_exam_2026.Supervisor_Id=Supervisor.Supervisor_Id WHERE Database_exam_2026.Room='D605'; 
