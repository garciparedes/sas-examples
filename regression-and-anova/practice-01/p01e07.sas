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
 * Exercise 7
 */
proc import out=work.narcotic
	datafile='/folders/myshortcuts/sas-examples/data/regression-and-anova/datatab_6_33.xls'
	dbms=XLS;
RUN;

proc print data=work.narcotic;
run;

proc anova data=work.narcotic;
	class trtment;
	model hrssleep = trtment;
	means trtment;
	means trtment/bon;
run;

/**
 * Analiza los datos y comenta los resultados:
 *
 * Tal y como se puede apreciar, tanto en el box-plot realizado, como en el test
 * de igualdad de medias de Bonferri, en este caso surgen dos grupos de medias:
 * Uno de los grupos, formado por el tratamiento de placebo (como era de
 * esperar), y un segundo grupo formado por los somniferos estándar y el nuevo
 * placebo. 
 * 
 * Según el test realizado, se asume igualdad de medias entre el somnifero 
 * estándar y el nuevo. Esto se debe a que el tamaño de la muestra y las 
 * diferencias de medias y varianza no son significativamente distintas como
 * para asumir que el nuevo somnifero genera resultados significativamente
 * diferentes de los que se obtienen con el somnífero estándar. 
 * 
 * Dicho test se ha realzado admitiendo un nivel de confianza del 95%
 *
 */
