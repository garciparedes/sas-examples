/**
 * 
 * Title:
 * 	Statistical Computation - Exercise Set 1 - Exercise 4
 * 
 * Date:
 * 	February 2018
 * 
 * Authors:
 * 	Sergio Garcia Prado - https://garciparedes.me
 * 
 */


/**
 * 
 * a)
 * 
 */

ods rtf file="/folders/myshortcuts/sas/sas-examples/data/alabur/ALABUR.rtf"; 

data alabur;
	infile "/folders/myshortcuts/sas/sas-examples/data/alabur/ALABUR.DAT";

	input PROVIN $ 1-2 MES $ 3-6 LLUVIA 7-11 MAXTEMP 12-16 MINTEMP 17-21 MEANTEMP 22-25;
	
	DIFR = MAXTEMP - MINTEMP;
	
	length PRECT $16 TEMP $16;
	
	if LLUVIA < 2.5 then do;
		PRECT = "SECO";
	end; else do;
		PRECT = "HUMEDO";
	end;
	
	if MEANTEMP <= 70 then do;
		TEMP = "FRIO";
	end; else do;
		TEMP = "CALIENTE";
	end;
	
run;

proc print data = alabur;
run;


/**
 * 
 * b)
 * 
 */


proc univariate data = alabur;
	var LLUVIA;
run;

proc univariate data = alabur;
	var LLUVIA;
	by PROVIN;
run;


/**
 * 
 * c)
 * 
 */


proc tabulate data = alabur;
	class TEMP PRECT;
	table TEMP, PRECT;
run;


/**
 * 
 * d)
 * 
 */


proc sgplot data = alabur;
	vbox LLUVIA / category = TEMP;
run;


/**
 * 
 * e)
 * 
 */

proc sgplot data = alabur;
	scatter x = MAXTEMP y = MINTEMP / 
		filledoutlinedmarkers
		markerfillattrs = (color = green)  
		markerattrs = (symbol = circlefilled 
									 size = 12); 
run;


/**
 * 
 * f)
 * 
 */

ods rtf close; 
