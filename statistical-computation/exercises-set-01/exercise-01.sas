/**
 * 
 * Title:
 * 	Statistical Computation - Exercise Set 1 - Exercise 1
 * 
 * Date:
 * 	February 2018
 * 
 * Authors:
 * 	Sergio Garcia Prado - https://garciparedes.me
 * 
 */


/**
 * a)
 * 
 * Create data set.
 */

data clase;
	input Nombre $ Sexo $ Edad Altura Peso;
	cards;

	Alfredo M 14 69.0 112.5
	Alicia F 13 56.5 84
	Barbara F 13 65.3 98
	Carol F 14 62.8 102.5
	Enrique M 14 63.5 102.5
	Jaime M 12 57.3 83
	Juana F 12 59.8 84.5
	Rosa F 15 62.5 112.5
	Guillermo M 13 62.5 84
	Juan M 12 59 99.5
	Laura F 11 51.3 50.5
	Marta F 14 64.3 90
	Luisa F 12 56.3 77
	María F 15 66.5 112
	Felipe M 16 72 150
	Roberto M 12 64.8 128
	Pedro M 15 67 133
 	Tomás M 11 57.5 85
 	Alberto M 15 66.5 112
;
run;


/**
 * Print data set.
 */

proc print data = clase;
run;


/**
 * b)
 * 
 * Get info about data set.
 */

proc contents data = clase;
run; 


/*
 * c)
 * 
 * Generate girls of class data set. 
 */

data clase_girls (drop = Sexo);
	set clase;
	where Sexo = 'F';
run;


/**
 * d)
 * 
 * Print girls of class without height and weight.
 */

proc print data=clase_girls (drop = Altura Peso);
run;


/**
 * e)
 * 
 * Generate data set with birth year.
 */

data clase_nacimiento (drop = Altura Peso);
	set clase;
	Nacimiento =  year(date()) - edad;
run;

proc print data = clase_nacimiento;
run;


/**
 * f)
 * 
 * Print splited girls/boys data set with birth year.
 */
proc sort data = clase_nacimiento;
 by sexo;
run;

proc print data = clase_nacimiento;
	by Sexo;
run;


/**
 * g)
 * 
 * Save sorted data set.
 */

libname claselib '/folders/myshortcuts/sas/sas-examples/data/clase/';

data claselib.clase_nacimiento;
	set clase_nacimiento;
run;

proc print data=claselib.clase_nacimiento;
run;


/**
 * h)
 * 
 * Sort by age and date
 */

data clase_nacimiento_ordenado;
	set claselib.clase_nacimiento;
run;

proc sort data = clase_nacimiento_ordenado;
	by descending edad sexo;
run;

proc print data = clase_nacimiento_ordenado;
run;
	