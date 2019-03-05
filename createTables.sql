CREATE UNLOGGED TABLE 
Students(
    StudentId int, 
    StudentName varchar(50), 
    Address varchar(200),
    BirthyearStudent smallint, 
    Gender char);

COPY Students(StudentId, StudentName, Address,BirthyearStudent, Gender) 
    FROM '/home/student/Desktop/mnt/ramdisk/tables/Students.table' 
    DELIMITER ',' CSV HEADER;

ALTER TABLE Students add primary key (StudentId);


CREATE UNLOGGED TABLE 
Degrees(
    DegreeId int UNIQUE,
    Dept varchar(50), 
    DegreeDescription varchar(200), 
    TotalECTS smallint);

COPY Degrees(DegreeId, Dept, DegreeDescription, TotalECTS) 
    FROM '/home/student/Desktop/mnt/ramdisk/tables/Degrees.table' 
    DELIMITER ',' CSV HEADER;

ALTER TABLE degrees add primary key (DegreeId);


CREATE UNLOGGED TABLE 
StudentRegistrationsToDegrees(
    StudentRegistrationId int,
    StudentId int, 
    DegreeId int, 
    RegistrationYear smallint);

COPY StudentRegistrationsToDegrees( StudentRegistrationId, StudentId, DegreeId, RegistrationYear)
    FROM '/home/student/Desktop/mnt/ramdisk/tables/StudentRegistrationsToDegrees.table' 
    DELIMITER ',' CSV HEADER;

ALTER TABLE StudentRegistrationsToDegrees add primary key (StudentRegistrationId);


CREATE UNLOGGED TABLE 
Teachers(
    TeacherId int UNIQUE, 
    TeacherName varchar(200), 
    Address varchar(200), 
    BirthyearTeacher smallint, 
    Gender char);

COPY Teachers(TeacherId, TeacherName, Address, BirthyearTeacher, Gender) 
    FROM '/home/student/Desktop/mnt/ramdisk/tables/Teachers.table' 
    DELIMITER ',' CSV HEADER;

ALTER TABLE Teachers add primary key (TeacherId);


CREATE UNLOGGED TABLE 
Courses(
    CourseId int UNIQUE, 
    CourseName varchar(50), 
    CourseDescription varchar(200), 
    DegreeId int,
    ECTS smallint);

COPY Courses(CourseId, CourseName, CourseDescription, DegreeId, ECTS) FROM
     '/home/student/Desktop/mnt/ramdisk/tables/Courses.table' DELIMITER
    ',' CSV HEADER;

ALTER TABLE Courses add primary key (CourseId);


CREATE UNLOGGED TABLE 
CourseOffers(
    CourseOfferId int,
    CourseId int, 
    Year smallint, 
    Quartile smallint);

COPY CourseOffers(CourseOfferId, CourseId, Year, Quartile) 
    FROM '/home/student/Desktop/mnt/ramdisk/tables/CourseOffers.table' 
    DELIMITER ',' CSV HEADER;

ALTER TABLE CourseOffers add primary key (CourseOfferId);


CREATE UNLOGGED TABLE 
TeacherAssignmentsToCourses(
    CourseOfferId int , 
    TeacherId int);

COPY TeacherAssignmentsToCourses(CourseOfferId, TeacherId) 
    FROM '/home/student/Desktop/mnt/ramdisk/tables/TeacherAssignmentsToCourses.table' 
    DELIMITER ',' CSV HEADER;


CREATE UNLOGGED TABLE 
StudentAssistants(
    CourseOfferId int, 
    StudentRegistrationId int);

COPY StudentAssistants(CourseOfferId, StudentRegistrationId) FROM
     '/home/student/Desktop/mnt/ramdisk/tables/StudentAssistants.table' DELIMITER
    ',' CSV HEADER;


CREATE UNLOGGED TABLE 
CourseRegistrations(
    CourseOfferId int, 
    StudentRegistrationId int, 
    Grade smallint);

COPY CourseRegistrations(CourseOfferId, StudentRegistrationId, Grade) 
    FROM '/home/student/Desktop/mnt/ramdisk/tables/CourseRegistrations.table' 
    CSV DELIMITER ',' NULL 'null' HEADER;

ANALYZE VERBOSE;
