create table students(
	student_id varchar2(255) not null, 
    student_key varchar2(255) not null, 
    name varchar2(255) not null, 
    date_added date not null, 
    gpa float(1) not null,
    category_id NUMBER not null, 
    enrollments NUMBER not null,
    PRIMARY key(student_id)
);  
create table teachers(
	teacher_id NUMBER not null,
    PRIMARY key(teacher_id)
);  
create table course_sections(
	emp_id NUMBER not null FOREIGN KEY REFERENCES teachers(teacher_id),
    year NUMBER not null, 
    term NUMBER not null, 
    ders_kod varchar2(255) not null FOREIGN KEY REFERENCES course_schedule(ders_kod), 
    section NUMBER not null,
    hour_num NUMBER not null, 
    credits NUMBER not null
); 
create table course_schedule(
	ders_kod varchar2(255) not null,
    year NUMBER not null, 
    term NUMBER not null, 
    section NUMBER not null,
    PRIMARY key(ders_kod)
);  
create table course_selections(
	stud_id NUMBER not null FOREIGN KEY REFERENCES students(student_id),
    year NUMBER not null, 
    term NUMBER not null, 
    qiymet_yuz NUMBER not null,
    qiymet_herf varchar2(255) not null
); 
