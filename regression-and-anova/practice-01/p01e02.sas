/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Regresión y ANOVA
 * Year: 2017/18
 * Author: Sergio García Prado (garciparedes.me)
 * Name: Práctica 01
 *
 */

/*
 * Exercise 2
 */
proc import OUT=WORK.MOUSE_MAZE
	DATAFILE='/folders/myshortcuts/sas-examples/data/regression-and-anova/datatab_6_29.xls'
	DBMS=XLS;
run;

proc print data=work.mouse_maze;
run;