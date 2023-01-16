INSERT INTO Inventories(name_inventory) 
	VALUES ('Матрас');
INSERT INTO Study_Status(name_study_status) 
	VALUES ('Бюджетная основа');
INSERT INTO Study_Form(name_study_form) 
	VALUES ('Заочная');
INSERT INTO Residence_Status(name_residence_status) 
	VALUES ('Проживает');
INSERT INTO Application_Statuses(name_application_status) 
	VALUES ('Принято');
INSERT INTO Hostel(address_of_hostel,number_rooms) 
	VALUES ('Москва, ул. Ленина, д.42, корпус 3',100);
INSERT INTO Furniture(name_furniture,date_purchase) 
	VALUES ('Стул','23-10-2010');
INSERT INTO Subjects(name_subject) 
	VALUES ('Высшая математика');
INSERT INTO Employee_Roles(name_role) 
	VALUES ('Администратор от университета'),('Сотрудник общежития');
INSERT INTO Employee(fcs,gender,id_role) 
	VALUES ('Иванов Иван Иванович',1,1),('Сергеев Иван Иванович',2,2);
INSERT INTO Verification(date_verification,id_examiner) 
	VALUES ('23-10-2022',1);
INSERT INTO Rooms(square,number_places,id_hostel,id_verification) 
	VALUES (32,4,1,1);
INSERT INTO Furniture_Room(installation_date,id_furniture,id_room) 
	VALUES ('23-10-2022',1,1);
INSERT INTO Students(fcs,gender,group_student,rating,id_room,id_study_status,id_study_form,id_residence_status) 
	VALUES ('Петров Иван Сергеевич',1,'1023-ИТ',100,1,1,1,1);
INSERT INTO Rented_Inventory(date_issue,id_student,id_inventory) 
	VALUES ('23-10-2022',1,1);
INSERT INTO Application_Placement(id_student,id_room,id_examiner,id_application_status) 
	VALUES (1,1,1,1);
INSERT INTO Progress(name_progress,confirmation_progress,ratio,date_added,id_student) 
	VALUES ('Значок ГТО',false,2,'23-10-2022',1);
INSERT INTO Students_Grades(grade,term,assessment_date,id_student,id_subject) 
	VALUES (5,6,'23-10-2022',1,1);




