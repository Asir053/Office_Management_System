SET SERVEROUTPUT ON;

  
create or replace function LangWithMostProjects(C OUT Requirements1.lang%Type)
	return int
		IS
  K int:=0;
  D int:=0;

  
BEGIN	
	FOR R IN (select lang,count(lang) as K from (select * from orders1 union select * from orders2@site_link) orders join (select * from requirements1 union select * from requirements2@site_link) requirements on orders.r_id=requirements.r_id group by requirements.lang) LOOP
	 
	 if R.K>D then
		C := R.lang;
		D := R.K;
	 end if;
	 
	END LOOP;
	return D;
	--DBMS_OUTPUT.PUT_LINE('Languages/Frameworks with most projects: '||C||' Number of projects: '||D);
END LangWithMostProjects;
/