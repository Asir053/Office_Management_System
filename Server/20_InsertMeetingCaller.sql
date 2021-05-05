SET SERVEROUTPUT ON;

DECLARE
	B1 varchar2(30) :='&ServerMeeting';
	B2 varchar2(30) :='&meetingDate';
	C  varchar2(30) :='&topicOfDiscussion';

BEGIN
	InsertMeetingGlobal(B1,B2,C);
END;
/
