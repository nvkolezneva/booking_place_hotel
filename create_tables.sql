CREATE TABLE IF NOT EXISTS Inventories (
	id_inventory SERIAL PRIMARY KEY,
	name_inventory varchar(150)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Study_Status (
	id_study_status SERIAL PRIMARY KEY,
	name_study_status varchar(150)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Study_Form (
	id_study_form SERIAL PRIMARY KEY,
	name_study_form varchar(150)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Residence_Status (
	id_residence_status SERIAL PRIMARY KEY,
	name_residence_status varchar(150)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Application_Statuses (
	id_application_status SERIAL PRIMARY KEY,
	name_application_status varchar(150)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Hostel (
	id_hostel SERIAL PRIMARY KEY,
	address_of_hostel varchar(250)  NOT NULL,
    number_rooms integer NOT NULL
);
CREATE TABLE IF NOT EXISTS Furniture (
	id_furniture SERIAL PRIMARY KEY,
	name_furniture varchar(150)  NOT NULL,
    date_purchase date NOT NULL
);
CREATE TABLE IF NOT EXISTS Subjects (
	id_subject SERIAL PRIMARY KEY,
	name_subject varchar(150)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Employee_Roles (
	id_role SERIAL PRIMARY KEY,
	name_role varchar(150)  NOT NULL 
);
CREATE TABLE IF NOT EXISTS Employee (
    id_employee SERIAL PRIMARY KEY,
    fcs varchar(250) NOT NULL,
    gender integer NOT NULL,
    id_role integer,
    FOREIGN KEY (id_role) REFERENCES Employee_Roles(id_role)
);
CREATE TABLE IF NOT EXISTS Verification (
	id_verification SERIAL PRIMARY KEY,
    date_verification date NOT NULL,
    id_examiner integer NOT NULL,
    FOREIGN KEY (id_examiner) REFERENCES Employee(id_employee)
);
CREATE TABLE IF NOT EXISTS Rooms (
	id_room SERIAL PRIMARY KEY,
    square integer NOT NULL,
    number_places integer NOT NULL,
    id_hostel integer NOT NULL,
    id_verification integer,
    FOREIGN KEY (id_hostel) REFERENCES Hostel(id_hostel),
    FOREIGN KEY (id_verification) REFERENCES Verification(id_verification)
);
CREATE TABLE IF NOT EXISTS Furniture_Room (
	id_furniture_room SERIAL PRIMARY KEY,
    installation_date date,
    id_furniture integer,
    id_room integer NOT NULL,
    FOREIGN KEY (id_furniture) REFERENCES Furniture(id_furniture),
    FOREIGN KEY (id_room) REFERENCES Rooms(id_room)
);
CREATE TABLE IF NOT EXISTS Students (
	id_student SERIAL PRIMARY KEY,
    fcs varchar(250) NOT NULL,
    gender integer NOT NULL,
    group_student varchar(250) NOT NULL,
    rating integer,
    id_room integer,
    id_study_status integer,
    id_study_form integer,
    id_residence_status integer,
    FOREIGN KEY (id_room) REFERENCES Rooms(id_room),
    FOREIGN KEY (id_study_status) REFERENCES Study_Status(id_study_status),
    FOREIGN KEY (id_study_form) REFERENCES Study_Form(id_study_form),
    FOREIGN KEY (id_residence_status) REFERENCES Residence_Status(id_residence_status)
);
CREATE TABLE IF NOT EXISTS Rented_Inventory (
	id_rented_inventory SERIAL PRIMARY KEY,
    date_issue date NOT NULL,
    id_student integer NOT NULL,
    id_inventory integer NOT NULL,
    FOREIGN KEY (id_student) REFERENCES Students(id_student),
    FOREIGN KEY (id_inventory) REFERENCES Inventories(id_inventory)
);
CREATE TABLE IF NOT EXISTS Application_Placement (
    id_application_placement SERIAL PRIMARY KEY,
    id_student integer NOT NULL,
    id_room integer NOT NULL,
    id_examiner integer,
    id_application_status integer NOT NULL,
    FOREIGN KEY (id_student) REFERENCES Students(id_student),
    FOREIGN KEY (id_room) REFERENCES Rooms(id_room),
    FOREIGN KEY (id_examiner) REFERENCES Employee(id_employee),
    FOREIGN KEY (id_application_status) REFERENCES Application_Statuses(id_application_status)
);
CREATE TABLE IF NOT EXISTS Progress (
    id_progress SERIAL PRIMARY KEY,
    name_progress varchar(250) NOT NULL,
    confirmation_progress boolean NOT NULL,
    ratio integer,
    date_added date NOT NULL,
    id_student integer NOT NULL,
    FOREIGN KEY (id_student) REFERENCES Students(id_student)
);
CREATE TABLE IF NOT EXISTS Students_Grades (
    id_students_grades SERIAL PRIMARY KEY,
    grade integer NOT NULL,
    term integer NOT NULL,
    assessment_date date NOT NULL,
    id_student integer NOT NULL,
    id_subject integer NOT NULL,
    FOREIGN KEY (id_student) REFERENCES Students(id_student),
    FOREIGN KEY (id_subject) REFERENCES Subjects(id_subject)
);