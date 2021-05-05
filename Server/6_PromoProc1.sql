SET SERVEROUTPUT ON;

create or replace procedure SetPromoPoints1
		IS
	B1 int :=0;
	B2 int :=0;
	C  int :=0;
	D  int :=0;
	E  int :=0;

--employee local so promotion demotion o local
BEGIN
	FOR R IN (SELECT Employee1.e_id as B1,Feedback1.ratings as B2 FROM Feedback1 INNER JOIN Orders1 ON Feedback1.or_id=Orders1.or_id INNER JOIN Project1 ON Orders1.or_id=Project1.or_id INNER JOIN Employee1 ON 
	Employee1.e_id=Project1.e1_id
	OR Employee1.e_id=Project1.e2_id OR Employee1.e_id=Project1.e3_id) LOOP
	 C := R.B1;
	 D := R.B2;
	 --E := R.B1;
	 if D=1 then
		E := -2;
	 elsif D=2 then
		E := -1;
	 elsif D=3 then
		E := 0;
	 elsif D=4 then
		E := 1;
	 elsif D=5 then
		E := 2;
	 end if;
	 --DBMS_OUTPUT.PUT_LINE(C||' '||D||' '||B);
		UPDATE Employee1 SET promo_points=promo_points+E WHERE e_id=C;
	END LOOP;

END SetPromoPoints1;
/
commit;


