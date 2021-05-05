SET SERVEROUTPUT ON;

--DECLARE
--  B Payment.p_id%TYPE := 0;
--  B1 Payment.p_id%TYPE := 0;
--  B2 Payment.date_paid%TYPE;
--  B3 Payment.date_paid%TYPE;
--  C Payment.date_paid%TYPE;
--  D Payment.date_paid%TYPE;
  
--create or replace procedure MonthlyRevenue(Y IN Payment.p_id%TYPE,M IN Payment.p_id%TYPE, K OUT Payment.p_id%TYPE)
		--IS
DROP VIEW StatusView;

		
CREATE VIEW StatusView AS
 SELECT *
 FROM Status;
 
commit;

DECLARE
  C int:=0;
  E int:=0;
  F int :=0;
  D int:=0;
  Y int:=&BusinessYear;
  
BEGIN		
	
	DBMS_OUTPUT.PUT_LINE('Month	Profit	Loss');
	FOR R IN (SELECT bzns_month,profit,loss FROM StatusView where bzns_year=Y) LOOP
	 D := R.bzns_month;
	 E := R.profit;
	 F := R.loss;
	 
	DBMS_OUTPUT.PUT_LINE(D||'	'||E||'	'||F);

	END LOOP;
	
END;
/