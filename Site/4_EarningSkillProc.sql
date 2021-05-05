SET SERVEROUTPUT ON;
  
create or replace procedure MostEarningSkillSite
		IS
  C varchar2(30);
  D int := 0;
  B2 varchar2(30);
  B3 int :=0;
  E int := 0;

  
BEGIN	
	FOR R IN (select lang as B2,sum(payment2.p_amount) as B3 from orders2 inner join payment2 on orders2.or_id=payment2.or_id inner join requirements2 on requirements2.r_id=orders2.r_id group by requirements2.lang order by sum(payment2.p_amount) desc) LOOP
	 C := R.B2;
	 D := R.B3;
	 E := E+1;
	 if E=1 then
		DBMS_OUTPUT.PUT_LINE('Skill in most demand: '||C||' total income: '||D);
		exit;
	 end if;
	END LOOP;
END MostEarningSkillSite;
/