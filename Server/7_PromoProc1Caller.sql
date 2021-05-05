SET SERVEROUTPUT ON;

--DECLARE
--  B Payment.p_id%TYPE := 0;
--  B1 Payment.p_id%TYPE := 0;
--  B2 Payment.date_paid%TYPE;
--  B3 Payment.date_paid%TYPE;
--  C Payment.date_paid%TYPE;
--  D Payment.date_paid%TYPE;
  
--create or replace procedure PromoDemo
--		IS
DECLARE
  B int := 0;
  B1 Payment.p_id%TYPE := 0;
  B2 Payment.date_paid%TYPE;
  B3 Payment.date_paid%TYPE;
  C int :=0;
  D int :=0;

   
BEGIN	
	SetPromoPoints1();

	FOR R IN (SELECT pr_id FROM PrDe1) LOOP
	 B := R.pr_id;
	END LOOP;

	
	FOR R IN (SELECT e_id,promo_points FROM Employee1) LOOP
	 C := R.e_id;
	 D := R.promo_points;

	--if D<3 then
	--	--UPDATE Employee SET promo_points=promo_points- WHERE e_id=C;
	--	B:=B+1;
	--	insert into PrDe values (B,C,1, '15-Dec-20');
	--els
	 if D>=3 and D<5 then
		UPDATE Employee1 SET promo_points=promo_points-3 WHERE e_id=C;
		B:=B+1;
		insert into PrDe1 values (B,C,2, '15-Jan-20');
	 elsif D>=5 then
		UPDATE Employee1 SET promo_points=promo_points-5 WHERE e_id=C;
		B:=B+1;
		insert into PrDe1 values (B,C,3, '15-Jan-20');
	 end if;
	END LOOP;
END;
/

commit;

select * from PrDe1;