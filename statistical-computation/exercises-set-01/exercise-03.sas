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

/* a.2) */

/* a.3) */

/* a.4) */

/* a.5) */

/* a.6) */


/**
 * 
 * b)
 * 
 */

proc tabulate data = hoja.todo;
	where LABORAL = 2;
	class TABACO ALCOHOL;
	table ALCOHOL , (N*TABACO);
	by SEXO;
run;

/**
 * Explanation: 
 * 
 * 
 * 
 */
