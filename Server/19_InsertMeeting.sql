SET SERVEROUTPUT ON;

create or replace procedure InsertMeetingGlobal(B1 IN Meeting1.meets_at%TYPE,B2 IN Meeting1.meets_at%TYPE,C IN Meeting1.meets_at%TYPE)
		IS
	D  int :=0;
	E  int :=0;
	F int:=0;
	G int:=0;

--employee local so promotion demotion o local
BEGIN
	FOR R IN (SELECT m_id FROM Meeting1) LOOP
	 D := R.m_id;
	END LOOP;
	D:=D+1;
	
	FOR R IN (SELECT m_id FROM Meeting2@site_link) LOOP
	 E := R.m_id;
	END LOOP;
	E:=E+1;
	
	if INSTR(B1,'Y') !=0 then
		insert into Meeting1(m_id,of_id,meets_at,ToD) values (D,1,B2,C); 
	elsif INSTR(B1,'N') !=0 then
		insert into Meeting2@site_link(m_id,of_id,meets_at,ToD) values (E,2,B2,C); 
	end if;
	
	--DBMS_OUTPUT.PUT_LINE('id of Employee of the Year: '||C||' Total rating: '||D);
END InsertMeetingGlobal;
/
commit;