/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Regresión y ANOVA
 * Year: 2017/18
 * Author: Sergio García Prado (garciparedes.me)
 * Name: Simple Regression - Exercise 01
 *
 */

filename reffile '/folders/myshortcuts/sas/sas-examples/data/heights/heights.txt';

proc import datafile=reffile dbms=dlm out=heights;
	getnames=yes;
	datarow=2;
run;


proc print data=heights;
run;

proc sgplot data=heights;
	scatter y = Dheight x = Mheight;
run;

proc reg data = heights;
	model Dheight = Mheight;
run;
