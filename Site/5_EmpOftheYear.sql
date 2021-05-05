SET SERVEROUTPUT ON;

create or replace procedure MRE2(Y IN int)
		IS
	B1 int :=0;
	B2 int :=0;
	C  int :=0;
	D  int :=0;
	E  int :=0;
	F int:=0;
	G int:=0;
	tot int:=0;

--employee local so promotion demotion o local
BEGIN
	FOR R IN (SELECT Employee2.e_id as B1,sum(Feedback2.ratings) as B2 FROM Feedback2 INNER JOIN Orders2 ON Feedback2.or_id=Orders2.or_id INNER JOIN Project2 ON Orders2.or_id=Project2.or_id INNER JOIN Employee2 ON 
	Employee2.e_id=Project2.e1_id
	OR Employee2.e_id=Project2.e2_id OR Employee2.e_id=Project2.e3_id group by Employee2.e_id,EXTRACT(year FROM to_date(Orders2.orders_date,'dd-mm-rr')) having EXTRACT(year FROM to_date(Orders2.orders_date,'dd-mm-rr'))=Y order by sum(Feedback2.ratings) desc ) LOOP
	 C := R.B1;
	 D := R.B2;
	 exit;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('id of Employee of the Year: '||C||' Total rating: '||D);
END MRE2;
/
