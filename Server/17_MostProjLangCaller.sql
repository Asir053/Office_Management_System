SET SERVEROUTPUT ON;

DECLARE
	C varchar2(30);
	D int:=0;


BEGIN
	D:=LangWithMostProjects(C);
	DBMS_OUTPUT.PUT_LINE('Languages/Frameworks with most projects: '||C||' Number of projects: '||D);
END;
/ 
