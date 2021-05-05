--Business Assistant DDB
clear screen;

--frag2



DROP TABLE Office2 CASCADE CONSTRAINTS;
DROP TABLE Employee2 CASCADE CONSTRAINTS;
DROP TABLE EmpPosition2 CASCADE CONSTRAINTS;
DROP TABLE PrDe2 CASCADE CONSTRAINTS;
DROP TABLE Project2 CASCADE CONSTRAINTS;
DROP TABLE Meeting2 CASCADE CONSTRAINTS;
DROP TABLE EstBudget2 CASCADE CONSTRAINTS;
DROP TABLE EstExpenses2 CASCADE CONSTRAINTS;
DROP TABLE Status2 CASCADE CONSTRAINTS;
DROP TABLE Client2 CASCADE CONSTRAINTS;
DROP TABLE Orders2 CASCADE CONSTRAINTS;
DROP TABLE Payment2 CASCADE CONSTRAINTS;
DROP TABLE Feedback2 CASCADE CONSTRAINTS;
DROP TABLE Requirements2 CASCADE CONSTRAINTS;

CREATE TABLE Office2 (
	of_id int, 
	location varchar2(30), 
	capital int, 
	revenue int, 
    PRIMARY KEY(of_id)); 


CREATE TABLE EmpPosition2(
	pos_id int PRIMARY KEY, 
	position varchar2(30),
	p_salary int
);


CREATE TABLE Employee2(
	e_id int,
	of_id int,	
	pos_id int,
	Ename varchar2(30), 
	email varchar2(30),
	phone varchar2(30),
	promo_points int,
	FOREIGN KEY(of_id) REFERENCES Office2(of_id),
	FOREIGN KEY(pos_id) REFERENCES EmpPosition2(pos_id),
	PRIMARY KEY(e_id));

CREATE TABLE PrDe2(
	pr_id int,
	e_id int,
	newpos_id int,
	prde_date varchar2(20),
	FOREIGN KEY(e_id) REFERENCES Employee2(e_id),
	PRIMARY KEY(pr_id));
	
 
CREATE TABLE Meeting2(
	m_id int PRIMARY KEY, 
	of_id int,
	meets_at varchar2(20),
	e1_id int,
	e2_id int,
	e3_id int,
	ToD varchar2(30),
	decision varchar2(30),
	FOREIGN KEY(of_id) REFERENCES Office2(of_id)
);
	

CREATE TABLE EstBudget2(
	b_id int PRIMARY KEY, 
	of_id int,
	b_month varchar2(30),
	b_amount int,
	FOREIGN KEY(of_id) REFERENCES Office2(of_id)
);
	
	
CREATE TABLE EstExpenses2(
	ex_id int PRIMARY KEY, 
	of_id int,
	exes_date varchar2(30),
	operating_expenses int,
	total_proj_cost int,	
	total_emp_sal int,
	debt int,
	FOREIGN KEY(of_id) REFERENCES Office2(of_id)
);

CREATE TABLE Status2(
	s_id int PRIMARY KEY, 
	of_id int,
	bzns_year varchar2(30),
	bzns_month varchar2(30),
	profit float(4),
	loss float(4),
	--finished_projects int,
	--total_loss int,
	FOREIGN KEY(of_id) REFERENCES Office2(of_id)
);


CREATE TABLE Client2(
	c_id int PRIMARY KEY,
	c_name varchar2(30), 
	c_email varchar(30),
	c_phone varchar2(30)
);
	
CREATE TABLE Requirements2(
	r_id int PRIMARY KEY,
	title varchar2(30),
	description varchar2(30),
	lang varchar2(30),	
	deadline varchar2(30)
);

CREATE TABLE Orders2(
	or_id int PRIMARY KEY, 
	c_id int,
	r_id int,
	orders_date varchar2(30), 
	canceled int,
	price_negotiated int
	--FOREIGN KEY(c_id) REFERENCES Client2(c_id)
	--FOREIGN KEY(r_id) REFERENCES Requirements2(r_id)
);
	
CREATE TABLE Project2 (
	proj_id int, 
	or_id int,
	pname varchar2(30),  
	FOREIGN KEY(or_id) REFERENCES Orders2(or_id),
	e1_id int,
	e2_id int,
	e3_id int,
	proj_cost int,
	PRIMARY KEY(proj_id)
);
	
CREATE TABLE Payment2(
	p_id int PRIMARY KEY, 
	or_id int,
	date_paid varchar2(30),
	p_amount int,
	FOREIGN KEY(or_id) REFERENCES Orders2(or_id)
);
	
	
CREATE TABLE Feedback2(
	f_id int PRIMARY KEY, 
	or_id int,
	comments varchar2(30),
	ratings int,
	FOREIGN KEY(or_id) REFERENCES Orders2(or_id)
);
	
	

	
	

insert into Office2 values (2, 'Chittagong', 45000, 0); 
insert into EmpPosition2 values (7001, 'Intern', 7000);
insert into EmpPosition2 values (7002, 'Junior Programmer', 10000);
insert into EmpPosition2 values (7003, 'Senior Programmer', 15000);
insert into Employee2 values (7001,2,7001, 'Abdullah Karim', 'akarim@gmail.com', '019555',0); 
insert into Employee2 values (7002,2,7001, 'Altaf', 'altaf@gmail.com', '017555',0); 
insert into Employee2 values (7003,2,7001, 'Carter', 'carter@gmail.com', '018555',0); 
insert into PrDe2 values (7001,7003,1, '2-Dec-19');
insert into Meeting2 values (7001,2,'2019-12-1',7001,7002,7003, 'What to buy next', 'CPU'); 
insert into EstBudget2 values (7001,2, 'Feb2020', 50000); 
insert into EstExpenses2 values (7001,2, '1-Nov-2019' , 3000, 0, 0, 0); 
insert into EstExpenses2 values (7002,2, '1-Jan-2020' , 2000, 0, 0, 0);
--insert into AnnualStatus values (1,1, '2019', 0, 0, 0, 0); 
insert into Client2 values (7001, 'Chris', 'chris@gmail.com', '0172345'); 
insert into Client2 values (7002, 'Shafkat', 'shfk88@gmail.com', '017890123'); 
insert into Requirements2 values (7001, 'student management', 'dynamic website','Java', '2020-3-11');
insert into Requirements2 values (7002, 'hotel management', 'dynamic website','Python', '2020-5-1'); 
insert into Requirements2 values (7003, 'library management', 'user friendly','Java', '2020-5-7');
insert into Orders2 values (7001,7001,7001,'3-Nov-19',0,5000); 
insert into Orders2 values (7002,7002,7002,'1-Jan-20',0,4000);
insert into Orders2 values (7003,7001,7003,'2-Jan-20',0,3000);
insert into Project2 values (7001,7001, 'JAVA-PROJECT1', 7001, 7002, 7003,1000); 
insert into Project2 values (7002,7002, 'PYTHON-PROJECT1', 7001, 7002, 7003,500); 
insert into Project2 values (7003,7003, 'JAVA-PROJECT2', 7001, 7002, 7003,1500); 
insert into Payment2 values (7001,7001,'1-Nov-19',5000); 
insert into Payment2 values (7002,7002,'13-Jan-20',8000); 
insert into Payment2 values (7003,7003,'19-Jan-20',9000);
insert into Feedback2 values (7001,7001, 'Nice',4); 
insert into Feedback2 values (7002,7002, 'Very Nice',5); 
insert into Feedback2 values (7003,7003, 'Very Nice',5); 



commit;
 
