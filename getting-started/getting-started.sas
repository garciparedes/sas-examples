* This is a comment ; 
/*This is also a comment */
/* 
 * This code example was extracted from:
 * 		https://onlinecourses.science.psu.edu/stat480/node/9
 */
OPTIONS NODATE LS=78;
TITLE "Example: Getting started with SAS";

DATA grade;
	INPUT subject gender $ 
		exam1 exam2 hwgrade $;
	DATALINES;
	10 M 80 84 A
	7 . 85 89 A
	4 F 90 . B
	20 M 82 85 B
	25 F 94 94 A
	14 F 88 84 C
	;
RUN;

PROC PRINT DATA=grade;
	VAR subject gender; 
RUN;
	