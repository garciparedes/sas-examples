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
 * Exercise 1
 */
proc import OUT=WORK.ANESTHESIA
	DATAFILE='/folders/myshortcuts/sas-examples/data/regression-and-anova/datatab_6_28.xls'
	DBMS=XLS;
RUN;
