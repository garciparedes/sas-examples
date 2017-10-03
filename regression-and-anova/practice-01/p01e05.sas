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
 * Exercise 5
 */
proc import out=work.fuel
	datafile='/folders/myshortcuts/sas-examples/data/regression-and-anova/datatab_6_32.xls'
	dbms=XLS;
RUN;

proc print data=work.fuel;
run;

proc anova data=work.fuel;
	class treatment;
	model y = treatment;
	means treatment;
	means treatment/scheffe;
run;

/**
 * Analiza si el uso de aditivos da como resultado un mayor rendimiento:
 * 
 * Puesto que se pretende comparar si el uso de algún tratamiento es mejor 
 * que el uso de ningún tipo de tratamiento (elección de 2), esto es similar
 * a estudiar si la media de un tratamiento es diferente del resto de medias de
 * los distintos tratamientos. Por tanto, estamos ante un caso en que nos 
 * interesa un test general más que entre pares de medias, lo cual nos hace 
 * decantarnos por el test de Scheffe.
 * 
 * Utilizando un nivel de confianza del 95% el test nos indica que el 
 * tratamiento 2 (no aplicar ningún tratamiento) es significativamente 
 * diferente de los demás, cuya media es menor. 
 * 
 * En cuanto al resto de tratamientos, según el test de scheffe cumplen la
 * hipótesis de igualdad de medias entre si los tratamientos 1 y 4, y los 
 * tratamientos 3 y 5. Tras analizar el significado de cada tratamiento es 
 * fácil llegar a la conclusión de que la razón se debe a que estos utilizan
 * el mismo aditivo (lo que les diferencia es la empresa fabricante). 
 * 
 * Como conclusión, el resultado es coherente con el significado de los datos.
 */