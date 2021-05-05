SET SERVEROUTPUT ON;

DECLARE
	ID int :=&meetingID;
	E1 int:=&emp1id;
	E2 int:=&emp2id;
	E3 int:=&emp3id;
	DECi varchar2(30) :='&EnterMeetingDecision';
	C int;
	D varchar2(30);
	E varchar2(30);

BEGIN
	if ID>7000 then
		update Meeting2 set e1_id=E1,e2_id=E2,e3_id=E3,decision=DECi where m_id=ID;
	end if;
	
	FOR R IN (select of_id,meets_at,decision from (select * from meeting1@site_link2 union select * from meeting2) meeting) LOOP
	 C := R.of_id;
	 E := R.meets_at;
	 D := R.decision;

	 DBMS_OUTPUT.PUT_LINE('Office id: '||C||' Meeting date: '||E||' Decision: '||D);	
	END LOOP;
END;
/

