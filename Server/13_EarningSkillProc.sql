SET SERVEROUTPUT ON;
  
create or replace procedure MostEarningSkillServer
		IS
  C varchar2(30);
  D int := 0;
  B2 varchar2(30);
  B3 int :=0;
  E int := 0;

  
BEGIN	
	FOR R IN (select lang as B2,sum(payment1.p_amount) as B3 from orders1 inner join payment1 on orders1.or_id=payment1.or_id inner join requirements1 on requirements1.r_id=orders1.r_id group by requirements1.lang order by sum(payment1.p_amount) desc) LOOP
	 C := R.B2;
	 D := R.B3;
	 E := E+1;
	 if E=1 then
		DBMS_OUTPUT.PUT_LINE('Skill in most demand: '||C||' total income: '||D);
		exit;
	 end if;
	END LOOP;
END MostEarningSkillServer;
/