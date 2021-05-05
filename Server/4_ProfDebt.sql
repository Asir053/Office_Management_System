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
		
DECLARE
  C FLOAT(4):=0;
  T_prf FLOAT(4):=0;
  T_dbt FLOAT(4) :=0;
  D FLOAT(4):=0;

  
BEGIN	
	FOR R IN (SELECT profit,loss FROM Status) LOOP
	 C := R.profit;
	 D := R.loss+(D+R.loss)*0.15;
	 
	 T_dbt:=T_dbt+D;
	 T_prf:=T_prf+C;
	 
	 if T_prf >= T_dbt then
		T_prf:=T_prf - T_dbt;
		T_dbt:=0;
	 else
		T_dbt:=T_dbt - T_prf;
		T_prf:=0;
	 end if;
	 	 
	 --have to find year total profit debt
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('HQ Profit and Debt till this year ends:');
	DBMS_OUTPUT.PUT_LINE(T_prf||' '||T_dbt);
END;
/