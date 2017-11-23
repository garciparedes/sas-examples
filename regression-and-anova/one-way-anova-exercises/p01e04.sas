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
 * Exercise 4
 */

/**
 * 25 vigas fabricadas con 5 porcentajes diferentes de arena, 5  de cada tipo
 */
proc import out=work.vigas datafile='/folders/myshortcuts/sas-examples/data/regression-and-anova/datatab_6_31.xls' 
	dbms=XLS;
run;

proc print data=work.vigas;
run;

proc anova data=work.vigas;
	class sandpct;
	model resist=sandpct;
	means sandpct;
	means sandpct/bon;
	means sandpct/duncan;
	means sandpct/tukey;
	means sandpct/scheffe;
	means sandpct/SNK;
run;


/**
 * Analiza el efecto de los distintos porcentajes de arena utilizando los 
 * datos ofrecidos
 * 
 * Tal y como se puede apreciar en el diagrama de cajas, en este caso sucede
 * un fenómeno de correlación entre las dos variables, es decir, cuanto más
 * porcentaje de arena, mayor es la resistencia de la viga. Sin embargo, dicha
 * situación no es lineal, dado que llegado a un punto, los resultados de 
 * resistencia se convierten en muy malos. Esto se denomina punto de rotura de
 * la mezcla. 
 * 
 * Tras realizar distintos test de igualdad de medias, en la mayoría de ellos
 * se obtiene el mismo resultado, que las muestras con un 35 % de arena tienen
 * la misma resistencia en promedio que las que tienen un 15%.
 * 
 * En lo que si que se contraponen los resultados de los tests realizados es en
 * el número de categorías distintas que hay en la muestra. Dichas diferencias 
 * surgen de tratar con el mismo promedio a los casos de 20% y 25%, que algunos
 * tests asumen como cierto mientras que otros no.
 * 
 * Por último, como punto óptimo para el porcentaje de arena en la viga y tras
 * analizar los resultados presentados, un 30% sería un valor adecuado, de tal
 * manera que se maximice la resistencia de dicho material.
 */

