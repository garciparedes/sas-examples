/**
 * 
 * Title:
 * 	Statistical Computation - Exercise Set 1 - Exercise 3
 * 
 * Date:
 * 	February 2018
 * 
 * Authors:
 * 	Sergio Garcia Prado - https://garciparedes.me
 * 
 */


/***
 * 
 * a)
 * 
 */


/* a.1) */

libname hoja "/folders/myshortcuts/sas/sas-examples/data/encuesta";

data hoja.encuesta;
	infile "/folders/myshortcuts/sas/sas-examples/data/encuesta/encuesta.txt" dlm='09'x;
	input CASO EDAD SEXO ECIVIL TABACO ALCOHOL;
 	
 	if TABACO = 9 then do;
		TABACO = .;
	end;
		
	if ALCOHOL = 9 then do;
		ALCOHOL = .;
	end;	

run;

proc print data = hoja.encuesta (obs = 10);
run;


/* a.2) */

proc format;
	value sexo 1 = "Hombre" 2 = "Mujer";	
	value tabaco 1 = "Fumador" 2 = "No Fumador";
run;

data hoja.encuesta;
	set hoja.encuesta;
	label ECIVIL ='ESTADO CIVIL';
	format SEXO sexo. TABACO tabaco.;
run;

proc print data = hoja.encuesta (obs = 10) label;
run;


/* a.3) */

proc univariate data = hoja.encuesta;
	var EDAD;
run;

proc sort data = hoja.encuesta;
	by SEXO;
run;

proc univariate data = hoja.encuesta;
	var EDAD;
	by SEXO;
run;


/* a.4) */


proc sgplot data = hoja.encuesta;
	vbox EDAD / category = TABACO;
run;

/* a.5) */

data social;
	set hoja.encuesta;
run;

proc contents data = social;
run;

/* a.6) */

proc sort data = hoja.encuesta;
	by CASO;
run;

proc sort data = social;
	by CASO;
run;

data encuesta_join;
	merge hoja.encuesta social;
	by CASO;
run;

proc print data = encuesta_join (obs = 10) label;
run;

/**
 * 
 * b)
 * 
 */

proc sort data = encuesta_join;
	by SEXO;
run;

proc tabulate data = encuesta_join;
	where ECIVIL = 2;
	class TABACO ALCOHOL;
	table ALCOHOL , (N * TABACO);
	by SEXO;
run;

/**
 * Explanation: 
 * The above SAS procedure generates a table. First of all, the 'where' statement
 * removes all observations that doesn't have 2 on ECIVIL variable. The 'class' 
 * statement indicates that TABACO and ALCOHOL will be the variables to
 * partition the data set. The 'table' statement indicates the the arrangement of the
 * table i.e. ALCOHOL on rows and TABACO on columns. Finally, the 'by' statement
 * indicates that we request one table per SEXO partition.
 * 
 * 
 */
