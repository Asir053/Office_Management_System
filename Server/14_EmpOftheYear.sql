SET SERVEROUTPUT ON;

create or replace procedure MRE1(Y IN int)
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
	FOR R IN (SELECT Employee1.e_id as B1,sum(Feedback1.ratings) as B2 FROM Feedback1 INNER JOIN Orders1 ON Feedback1.or_id=Orders1.or_id INNER JOIN Project1 ON Orders1.or_id=Project1.or_id INNER JOIN Employee1 ON 
	Employee1.e_id=Project1.e1_id
	OR Employee1.e_id=Project1.e2_id OR Employee1.e_id=Project1.e3_id group by Employee1.e_id,EXTRACT(year FROM to_date(Orders1.orders_date,'dd-mm-rr')) having EXTRACT(year FROM to_date(Orders1.orders_date,'dd-mm-rr'))=Y order by sum(Feedback1.ratings) desc ) LOOP
	 C := R.B1;
	 D := R.B2;
	 exit;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('id of Employee of the Year: '||C||' Total rating: '||D);
END MRE1;
/
