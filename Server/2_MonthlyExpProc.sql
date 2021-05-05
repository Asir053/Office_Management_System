SET SERVEROUTPUT ON;


--DROP VIEW EmpPosition CASCADE CONSTRAINTS;
--DROP VIEW EstExpenses CASCADE CONSTRAINTS;
--DROP VIEW Project CASCADE CONSTRAINTS;
--DROP VIEW Orders CASCADE CONSTRAINTS;
--
--CREATE VIEW EmpPosition AS
--select * from EmpPosition1 union
--select * from EmpPosition2;
--
--CREATE VIEW EstExpenses AS
--select * from EstExpenses1 union
--select * from EstExpenses2;
--
--CREATE VIEW Project AS
--select * from Project1 union
--select * from Project2;
--
--CREATE VIEW Orders AS
--select * from Orders1 union
--select * from Orders2;

  
create or replace procedure MonthlyExpenses(Y IN Payment1.p_id%TYPE,M IN Payment1.p_id%TYPE, B OUT Payment1.p_id%TYPE)
		IS
  B1 Payment1.p_id%TYPE := 0;
  B2 Payment1.p_id%TYPE := 0;
  B3 Payment1.p_id%TYPE := 0;
  B4 Payment1.p_id%TYPE := 0;
  C1 Payment1.p_id%TYPE := 0;
  C2 Payment1.p_id%TYPE := 0;
  D Payment1.p_id%TYPE := 0;
  F1 Payment1.p_id%TYPE := 0;
  G1 Payment1.p_id%TYPE := 0;
  F2 Payment1.p_id%TYPE := 0;
  G2 Payment1.p_id%TYPE := 0;
  K1 EstExpenses1.exes_date%TYPE;
  K2 EstExpenses1.exes_date%TYPE;
  
BEGIN	
	FOR R IN (SELECT SUM(EmpPosition.p_salary) as B1 FROM (select * from EmpPosition1 union select * from EmpPosition2@site_link) EmpPosition INNER JOIN  (select * from Employee1 union select * from Employee2@site_link) Employee ON EmpPosition.pos_id=Employee.pos_id ) LOOP
	 B := R.B1;	 
	 --DBMS_OUTPUT.PUT_LINE('Total salary: '||B);
	END LOOP;
	
	FOR R1 IN (SELECT EXTRACT(month FROM to_date(exes_date,'dd-mm-rr')) as B1, EXTRACT(year FROM to_date(exes_date,'dd-mm-rr')) as B2, SUM(EstExpenses.operating_expenses) as B3 FROM (select * from EstExpenses1 union select * from EstExpenses2@site_link) EstExpenses group by EXTRACT(month FROM to_date(exes_date,'dd-mm-rr')) , EXTRACT(year FROM to_date(exes_date,'dd-mm-rr')) ) LOOP
	 F1 := R1.B1;
	 G1 := R1.B2;
	 --if input month and year equal
	 C1 := R1.B3;
	 if M= F1 and Y= G1 then
		B:= C1+B;
	 end if;
	 --DBMS_OUTPUT.PUT_LINE(F1||' '||G1||' '||C1);
	END LOOP;
	
	
	FOR R2 IN (SELECT EXTRACT(month FROM to_date(orders_date,'dd-mm-rr')) as B1, EXTRACT(year FROM to_date(orders_date,'dd-mm-rr')) as B2, SUM(Project.proj_cost) as B3 FROM (select * from Project1 union select * from Project2@site_link) Project INNER JOIN (select * from Orders1 union select * from Orders2@site_link) Orders on Project.or_id = Orders.or_id group by EXTRACT(month FROM to_date(orders_date,'dd-mm-rr')) , EXTRACT(year FROM to_date(orders_date,'dd-mm-rr'))) LOOP
	 F2 := R2.B1;
	 G2 := R2.B2;
	 C2 := R2.B3;
	 if M= F2 and Y= G2 then
		B:= C2+B;
	 end if;
	 --DBMS_OUTPUT.PUT_LINE(F2||' '||G2||' '||C2);
	END LOOP;
	
	
	--DBMS_OUTPUT.PUT_LINE('January 2020: '||B);
	
END MonthlyExpenses;
/

--select EmpPosition1.p_salary,EmpPosition1.pos_id from EmpPosition1 union select EmpPosition2.p_salary,EmpPosition2.pos_id from EmpPosition2
--select Employee1.pos_id from Employee1 union select Employee2.pos_id from Employee2
--select EstExpenses1.exes_date,EstExpenses1.operating_expenses from EstExpenses1 union select EstExpenses2.exes_date,EstExpenses2.operating_expenses from EstExpenses2
--select Project1.or_id,Project1.proj_cost from Project1 union select Project2.or_id,Project2.proj_cost from Project2
--select Orders1.or_id,Orders1.orders_date from Orders1 union select Orders2.or_id,Orders2.orders_date from Orders2