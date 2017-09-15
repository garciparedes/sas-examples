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

PROC PRINT data=poblacion;
RUN;

/*
 * Exercise 2 
 */

data poblasup;
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