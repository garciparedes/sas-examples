/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Regresión y ANOVA
 * Year: 2017/18
 * Author: Sergio García Prado (garciparedes.me)
 * Name: Práctica 0
 * 
 */

/*
 * Exercise 1
 */

DATA poblacion;
	FORMAT provincia $12.;
	INPUT provincia $ poblacion;
	CARDS;
		Avila 168638
		Burgos 365972
		Leon 497387
		Palencia 173281
		Salamanca 351326
		Segovia 159322
		Soria 95593
	;
RUN;

PROC PRINT DATA=poblacion;
RUN;

/*
 * Exercise 2 
 */

DATA poblasup;
	FORMAT provincia $12.;
	MERGE poblacion;
	INPUT provincia $ superficie;
	CARDS;
		Avila 8048
		Burgos 14269
		Leon 15468
		Palencia 8029
		Salamanca 12336
		Segovia 6949
		Soria 10287
	;
RUN;

PROC PRINT data=poblasup;
RUN;

/*
 * Exercise 3 
 */

DATA completo;
	FORMAT provincia $12.;
	INPUT provincia $ poblacion superficie;
	CARDS; 
		Valladolid 521661 8202
		Zamora 197237 10559
	;
	
RUN;

PROC APPEND BASE=completo DATA=poblasup;
RUN;


/*
PROC EXPORT data=completo outfile="/folders/myfolders/completo.txt";
RUN;
*/

PROC PRINT DATA=completo;
RUN;

/*
 * Exercise 4 
 */

DATA completo;
	SET completo;
	densidad = poblacion / superficie;
RUN;

PROC PRINT DATA=completo;
RUN;

/*
 * Exercise 5 
 */

PROC SORT DATA=completo;
 BY DESCENDING densidad;
RUN;

PROC PRINT DATA=completo;
RUN;


/*
 * Exercise 6
 */

DATA clasificado;
	SET completo;
	FORMAT tamano $12.;
	IF superficie > 10000 THEN tamano = 'grande';
	ELSE tamano = 'pequeno';
RUN;

PROC PRINT DATA=clasificado;
RUN;
 