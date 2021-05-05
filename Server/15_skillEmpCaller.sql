SET SERVEROUTPUT ON;

DECLARE
	Y int:=&yr;

BEGIN
	MostEarningSkillServer();
	MRE1(Y);
END;
/ 
