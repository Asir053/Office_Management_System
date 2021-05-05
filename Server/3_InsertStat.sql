SET SERVEROUTPUT ON;


--CREATE TABLE Status AS
--select * from Status1 union
--select * from Status2;

DECLARE
  Y Emp.eid%TYPE := &business_year;
  B Emp.eid%TYPE := 0;
  C Emp.eid%TYPE := 0;
  D Emp.eid%TYPE := 0;
  i Emp.eid%TYPE := 0;
  zeroRev Emp.eid%TYPE := 0;
  Prf FLOAT(4) := 0;
  Lss FLOAT(4) := 0;
  EstY Emp.eid%TYPE := 2019;
  EstM Emp.eid%TYPE := 11;
  --Global capital
  Capital Emp.eid%TYPE := 50000;
  
BEGIN	
	--extract from office table EstY,EstM,Capital
	--(s_id,bzns_year,bzns_month,profit,loss)
	DELETE FROM Status WHERE bzns_year=Y;
	
	FOR i IN 1..12 LOOP
		MonthlyRevenue(Y,i,C);
		MonthlyExpenses(Y,i,D);
		
		
		--if Y=EstY and i=EstM then
		--	if (Capital+C)>D then 
		--		Prf:=(Capital+C-D);
		--		DBMS_OUTPUT.PUT_LINE('Month: '||i||' Profit: '||Prf);
		--		insert into Status values (CONCAT(i,Y),1, Y, i, Prf,0); 
		--	else
		--		Lss:=(D-Capital-C);
		--		DBMS_OUTPUT.PUT_LINE('Month: '||i||' Loss: '||Lss);
		--		insert into Status values (CONCAT(i,Y),1, Y, i,0,Lss);
		--	end if;
		--	exit;
		--end if;
		
		
		if Y!=EstY and i!=EstM then
			Capital:=0;
		end if;	
		
		
		--if C>D then
		--	Prf:=(C-D);
		--	DBMS_OUTPUT.PUT_LINE('Month: '||i||' Profit: '||Prf);
		--	insert into Status values (CONCAT(i,Y),1, Y, i, Prf,0);
		--elsif C<D then
		--	Lss:=(D-C);
		--	DBMS_OUTPUT.PUT_LINE('Month: '||i||' Loss: '||Lss);
		--	insert into Status values (CONCAT(i,Y),1, Y, i,0,Lss);
		--else
		--	Prf:=0;
		--	DBMS_OUTPUT.PUT_LINE('Month: '||i||' Profit: '||Prf);
		--	insert into Status values (CONCAT(i,Y),1, Y, i, 0,0);
		--end if;
		
		if (Capital+C)>D then
			Prf:=(Capital+C-D);
			DBMS_OUTPUT.PUT_LINE('Month: '||i||' Profit: '||Prf);
			insert into Status values (CONCAT(i,Y),1, Y, i, Prf,0);
		elsif (Capital+C)<D then
			Lss:=(D-Capital-C);
			DBMS_OUTPUT.PUT_LINE('Month: '||i||' Loss: '||Lss);
			insert into Status values (CONCAT(i,Y),1, Y, i,0,Lss);
		else
			Prf:=0;
			DBMS_OUTPUT.PUT_LINE('Month: '||i||' Profit: '||Prf);
			insert into Status values (CONCAT(i,Y),1, Y, i, 0,0);
		end if;
		
		
	END LOOP;
END;
/
commit;


