--Business Assistant DDB
clear screen;

DROP TABLE Office1 CASCADE CONSTRAINTS;
DROP TABLE Employee1 CASCADE CONSTRAINTS;
DROP TABLE EmpPosition1 CASCADE CONSTRAINTS;
DROP TABLE PrDe1 CASCADE CONSTRAINTS;
DROP TABLE Project1 CASCADE CONSTRAINTS;
DROP TABLE Meeting1 CASCADE CONSTRAINTS;
DROP TABLE EstBudget1 CASCADE CONSTRAINTS;
DROP TABLE EstExpenses1 CASCADE CONSTRAINTS;
DROP TABLE Status1 CASCADE CONSTRAINTS;
DROP TABLE Status CASCADE CONSTRAINTS;
DROP TABLE Client1 CASCADE CONSTRAINTS;
DROP TABLE Orders1 CASCADE CONSTRAINTS;
DROP TABLE Payment1 CASCADE CONSTRAINTS;
DROP TABLE Feedback1 CASCADE CONSTRAINTS;
DROP TABLE Requirements1 CASCADE CONSTRAINTS;

CREATE TABLE Office1 (
	of_id int, 
	location varchar2(30), 
	capital int, 
	revenue int, 
    PRIMARY KEY(of_id)); 


CREATE TABLE EmpPosition1(
	pos_id int PRIMARY KEY, 
	position varchar2(30),
	p_salary int
);


CREATE TABLE Employee1(
	e_id int,
	of_id int,	
	pos_id int,
	Ename varchar2(30), 
	email varchar2(30),
	phone varchar2(30),
	promo_points int,
	FOREIGN KEY(of_id) REFERENCES Office1(of_id),
	FOREIGN KEY(pos_id) REFERENCES EmpPosition1(pos_id),
	PRIMARY KEY(e_id));

CREATE TABLE PrDe1(
	pr_id int,
	e_id int,
	newpos_id int,
	prde_date varchar2(20),
	FOREIGN KEY(e_id) REFERENCES Employee1(e_id),
	PRIMARY KEY(pr_id));
	
 
CREATE TABLE Meeting1(
	m_id int PRIMARY KEY, 
	of_id int,
	meets_at varchar2(20),
	e1_id int,
	e2_id int,
	e3_id int,
	ToD varchar2(30),
	decision varchar2(30),
	FOREIGN KEY(of_id) REFERENCES Office1(of_id)
);
	

CREATE TABLE EstBudget1(
	b_id int PRIMARY KEY, 
	of_id int,
	b_month varchar2(30),
	b_amount int,
	FOREIGN KEY(of_id) REFERENCES Office1(of_id)
);
	
	
CREATE TABLE EstExpenses1(
	ex_id int PRIMARY KEY, 
	of_id int,
	exes_date varchar2(30),
	operating_expenses int,
	total_proj_cost int,	
	total_emp_sal int,
	debt int,
	FOREIGN KEY(of_id) REFERENCES Office1(of_id)
);

CREATE TABLE Status1(
	s_id int PRIMARY KEY, 
	of_id int,
	bzns_year varchar2(30),
	bzns_month varchar2(30),
	profit float(4),
	loss float(4),
	--finished_projects int,
	--total_loss int,
	FOREIGN KEY(of_id) REFERENCES Office1(of_id)
);



--GLOBAL STATUS TABLE

CREATE TABLE Status(
	s_id int PRIMARY KEY, 
	of_id int,
	bzns_year varchar2(30),
	bzns_month varchar2(30),
	profit float(4),
	loss float(4)
);


CREATE TABLE Client1(
	c_id int PRIMARY KEY,
	c_name varchar2(30), 
	c_email varchar(30),
	c_phone varchar2(30)
);

CREATE TABLE Requirements1(
	r_id int PRIMARY KEY,
	title varchar2(30),
	description varchar2(30),	
	lang varchar2(30),
	deadline varchar2(30)
);
	

CREATE TABLE Orders1(
	or_id int PRIMARY KEY, 
	c_id int,
	r_id int,
	orders_date varchar2(30), 
	canceled int,
	price_negotiated int
	--FOREIGN KEY(c_id) REFERENCES Client1(c_id)
	--FOREIGN KEY(r_id) REFERENCES Requirements1(r_id)
);
	
CREATE TABLE Project1 (
	proj_id int, 
	or_id int,
	pname varchar2(30),  
	FOREIGN KEY(or_id) REFERENCES Orders1(or_id),
	e1_id int,
	e2_id int,
	e3_id int,
	proj_cost int,
	PRIMARY KEY(proj_id)
);
	
CREATE TABLE Payment1(
	p_id int PRIMARY KEY, 
	or_id int,
	date_paid varchar2(30),
	p_amount int,
	FOREIGN KEY(or_id) REFERENCES Orders1(or_id)
);
	
	
CREATE TABLE Feedback1(
	f_id int PRIMARY KEY, 
	or_id int,
	comments varchar2(30),
	ratings int,
	FOREIGN KEY(or_id) REFERENCES Orders1(or_id)
);
	
	

	
	

insert into Office1 values (1, 'Dhaka', 50000, 0); 
insert into EmpPosition1 values (1, 'Intern', 7000);
insert into EmpPosition1 values (2, 'Junior Programmer', 10000);
insert into EmpPosition1 values (3, 'Senior Programmer', 15000);
insert into Employee1 values (1,1,1, 'Abdullah Karim', 'akarim@gmail.com', '019555',0); 
insert into Employee1 values (2,1,1, 'Altaf', 'altaf@gmail.com', '017555',0); 
insert into Employee1 values (3,1,1, 'Carter', 'carter@gmail.com', '018555',0); 
insert into PrDe1 values (1,3,1, '2-Dec-19');
insert into Meeting1 values (1,1,'2019-12-1',1,2,3, 'What to buy next', 'GPU'); 
insert into EstBudget1 values (1,1, 'Feb2020', 50000); 
insert into EstExpenses1 values (1,1, '1-Nov-2019' , 3000, 0, 0, 0); 
insert into EstExpenses1 values (2,1, '1-Jan-2020' , 2000, 0, 0, 0);
--insert into AnnualStatus values (1,1, '2019', 0, 0, 0, 0); 
insert into Client1 values (1, 'Chris', 'chris@gmail.com', '0172345'); 
insert into Client1 values (2, 'Shafkat', 'shfk88@gmail.com', '017890123'); 
insert into Requirements1 values (1, 'student management', 'dynamic website','C#', '2020-3-11');
insert into Requirements1 values (2, 'hotel management', 'dynamic website','PHP', '2020-5-1'); 
insert into Requirements1 values (3, 'library management', 'user friendly','PHP', '2020-5-7');
insert into Orders1 values (1,1,1,'3-Nov-19',0,5000); 
insert into Orders1 values (2,1,2,'1-Jan-20',0,3000);
insert into Orders1 values (3,1,3,'2-Jan-20',0,3000);
insert into Project1 values (1,1, 'C#-PROJECT1', 1, 2, 3,1000); 
insert into Project1 values (2,2, 'PHP-PROJECT1', 1, 2, 3,500); 
insert into Project1 values (3,3, 'PHP-PROJECT1', 1, 2, 3,1500); 
insert into Payment1 values (1,1,'1-Nov-19',5000); 
insert into Payment1 values (2,2,'13-Jan-20',8000); 
insert into Payment1 values (3,3,'19-Jan-20',9000);
insert into Feedback1 values (1,1, 'Nice',4); 
insert into Feedback1 values (2,2, 'Very Nice',5); 
insert into Feedback1 values (3,3, 'Very Nice',5); 



commit;
 
