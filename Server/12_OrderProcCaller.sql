SET SERVEROUTPUT ON;

--customer id er upor depend kre order ta kon site a jacce
--order local hoy but project onno site a jete paare according to requirement table
DECLARE
	or_date Orders1.orders_date%TYPE:='&inp_date';
	inp_c_id int :=&customer_id;
	fixed_price int:=&price;
	reqrmnt varchar2(30):='&requirement';
	K1 int:=0;
	K2 int:=0;
	B2 int:=0;
	F int :=0;
	V1 int:=0;
	V2 int:=0;
	T int:=0;
	NAME varchar2(30);
	MAIL varchar2(30);
	PHONE varchar2(30);
	D int:=0;
	EF1 int:=0;
	EF2 int:=0;
	client_not_found_ex1 EXCEPTION;
	PRAGMA EXCEPTION_INIT (client_not_found_ex1, -20002);


BEGIN

	FOR R IN (select c_id as B2 from Client1) LOOP
		D:=R.B2;
		if D=inp_c_id then
			EF1 :=1;
		end if;
	end loop;
	
	FOR R IN (select c_id as B2 from Client2@site_link) LOOP
		D:=R.B2;
		if D=inp_c_id then
			EF2 :=1;
		end if;
	end loop;
	
	
	if EF1=0 and EF2=0 then
		raise_application_error(-20002,'Client not found,try again!');
	end if;


	FOR R IN (select r_id as B2 from Requirements1) LOOP
		K1:=R.B2;
	end loop;
	K1:=K1+1;
	FOR R IN (select r_id as B2 from Requirements2@site_link) LOOP
		K2:=R.B2;
	end loop;
	K2:=K2+1;
	FOR R IN (select c_id as B2 from Client1) LOOP
		V1:=R.B2;
	end loop;
	V1:=V1+1;
	FOR R IN (select c_id as B2 from Client2@site_link) LOOP
		V2:=R.B2;
	end loop;
	V2:=V2+1;	

	if ((INSTR(reqrmnt,'C#') !=0 or INSTR(reqrmnt,'PHP') !=0) and (inp_c_id > 7000)) then
	
		insert into Requirements1 values (K1,'student management', 'dynamic website',reqrmnt, '2020-3-11'); 
		select c_name into NAME from Client2@site_link where c_id=inp_c_id;
		select c_email into MAIL  from Client2@site_link where c_id=inp_c_id;
		select c_phone into PHONE from Client2@site_link where c_id=inp_c_id;
		insert into Client1 values (V1,NAME,MAIL,PHONE);
		InsertOrderWithDiscount1(or_date,V1,fixed_price,K1);

		
	elsif ((INSTR(reqrmnt,'C#') !=0 or INSTR(reqrmnt,'PHP') !=0) and (inp_c_id < 7000)) then
		insert into Requirements1 values (K1,'student management', 'dynamic website',reqrmnt, '2020-3-11'); 
		InsertOrderWithDiscount1(or_date,inp_c_id,fixed_price,K1);

	elsif ((INSTR(reqrmnt,'Python') !=0 or INSTR(reqrmnt,'Java') !=0) and (inp_c_id > 7000)) then
		insert into Requirements2@site_link values (K2,'hotel management', 'dynamic website',reqrmnt, '2020-5-1');
		InsertOrderWithDiscount2(or_date,inp_c_id,fixed_price,K2);
		
	elsif ((INSTR(reqrmnt,'Python') !=0 or INSTR(reqrmnt,'Java') !=0) and (inp_c_id < 7000)) then
		insert into Requirements2@site_link values (K2,'hotel management', 'dynamic website',reqrmnt, '2020-5-1');
		select c_name into NAME from Client1 where c_id=inp_c_id;
		select c_email into MAIL  from Client1 where c_id=inp_c_id;
		select c_phone into PHONE from Client1 where c_id=inp_c_id;
		insert into Client2@site_link values (V2,NAME,MAIL,PHONE);
		InsertOrderWithDiscount2(or_date,V2,fixed_price,K2);
		
	end if;

	--InsertOrderWithDiscount(or_date,inp_c_id,fixed_price);
END;
/ 
commit;

select * from orders1;
select * from orders2@site_link;