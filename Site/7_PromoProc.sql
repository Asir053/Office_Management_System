SET SERVEROUTPUT ON;

create or replace procedure SetPromoPoints2
		IS
	B1 int :=0;
	B2 int :=0;
	C  int :=0;
	D  int :=0;
	E  int :=0;

--employee local so promotion demotion o local
BEGIN
	FOR R IN (SELECT Employee2.e_id as B1,Feedback2.ratings as B2 FROM Feedback2 INNER JOIN Orders2 ON Feedback2.or_id=Orders2.or_id INNER JOIN Project2 ON Orders2.or_id=Project2.or_id INNER JOIN Employee2 ON 
	Employee2.e_id=Project2.e1_id
	OR Employee2.e_id=Project2.e2_id OR Employee2.e_id=Project2.e3_id) LOOP
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
		UPDATE Employee2 SET promo_points=promo_points+E WHERE e_id=C;
	END LOOP;

END SetPromoPoints2;
/
commit;


