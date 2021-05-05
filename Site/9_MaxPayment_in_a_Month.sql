SET SERVEROUTPUT ON;

DECLARE
	C varchar2(30);
	D int:=0;
	Y int:=&yr;
	M int:=&mnth;

BEGIN
	select date_paid into C from payment2 where p_amount= (select max(p_amount) from payment2 
	group by EXTRACT(month FROM to_date(date_paid,'dd-mm-rr')),EXTRACT(year FROM to_date(date_paid,'dd-mm-rr'))
	having EXTRACT(month FROM to_date(date_paid,'dd-mm-rr'))=M and
	EXTRACT(year FROM to_date(date_paid,'dd-mm-rr'))=Y);
	select p_amount into D from payment2 where p_amount= (select max(p_amount) from payment2
	group by EXTRACT(month FROM to_date(date_paid,'dd-mm-rr')),EXTRACT(year FROM to_date(date_paid,'dd-mm-rr'))
	having EXTRACT(month FROM to_date(date_paid,'dd-mm-rr'))=M and
	EXTRACT(year FROM to_date(date_paid,'dd-mm-rr'))=Y);
	
	DBMS_OUTPUT.PUT_LINE('Date when max amount was paid: '||C||' Amount: '||D);
END;
/ 


