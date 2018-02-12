/**
 * 
 * Title:
 * 	Statistical Computation - Exercise Set 0 - Exercise 2
 * 
 * Date:
 * 	February 2018
 * 
 * Authors:
 * 	Sergio Garcia Prado - https://garciparedes.me
 * 
 */


/**
 * Create data set
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
 * Print data set
 */

proc print data=clase;
run;


/**
 * Get info about observations and variables
 */

proc contents data=clase position;
run;


/**
 * Save data set in SAS format
 */

options dlcreatedir;
libname clase '/folders/myshortcuts/sas/sas-examples/data/clase/';

data clase.clase;
	set clase;
run;


/**
 * Save data set in txt format
 */
data clase.clase_txt;
	set clase;
	file '/folders/myshortcuts/sas/sas-examples/data/clase/clase.txt';
	put _all_;
run;