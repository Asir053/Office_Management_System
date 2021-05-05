SET SERVEROUTPUT ON;

--DECLARE
--  B Payment.p_id%TYPE := 0;
--  B1 Payment.p_id%TYPE := 0;
--  B2 Payment.date_paid%TYPE;
--  B3 Payment.date_paid%TYPE;
--  C Payment.date_paid%TYPE;
--  D Payment.date_paid%TYPE;
--DROP TABLE Payment CASCADE CONSTRAINTS;
--CREATE TABLE Payment AS
--select * from Payment1 union
--select * from Payment2;
  
create or replace procedure MonthlyRevenue(Y IN Payment1.p_id%TYPE,M IN Payment1.p_id%TYPE, K OUT Payment1.p_id%TYPE)
		IS
  B Payment1.p_id%TYPE := 0;
  B1 Payment1.p_id%TYPE := 0;
  B2 Payment1.date_paid%TYPE;
  B3 Payment1.date_paid%TYPE;
  C Payment1.date_paid%TYPE;
  D Payment1.date_paid%TYPE;
  --inputmonth Payment.date_paid%TYPE := 1;
  --inputyear Payment.date_paid%TYPE := 2020;
  
BEGIN	
	FOR R IN (SELECT EXTRACT(month FROM to_date(date_paid,'dd-mm-rr')) as B2, EXTRACT(year FROM to_date(date_paid,'dd-mm-rr')) as B3 ,SUM(p_amount) as B1 FROM (select * from Payment1 union select * from Payment2@site_link) Payment  group by EXTRACT(month FROM to_date(date_paid,'dd-mm-rr')) , EXTRACT(year FROM to_date(date_paid,'dd-mm-rr')) ) LOOP
	 C := R.B2;
	 D := R.B3;
	 B := R.B1;
	 if M= C and Y= D then
		K:= B;
	 end if;
	 --DBMS_OUTPUT.PUT_LINE(C||' '||D||' '||B);
	END LOOP;
END MonthlyRevenue;
/