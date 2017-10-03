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

/**
 * Tiempo empleado en salir de un mismo laberinto por 15 ratones, divididos en
 * tres grupos de cinco, de modo que en cada grupo el color de las puertas
 * era rojo, verde o negro.
 */
proc import OUT=WORK.MOUSE_MAZE DATAFILE='/folders/myshortcuts/sas-examples/data/regression-and-anova/datatab_6_29.xls' 
		DBMS=XLS;
run;

proc print data=work.mouse_maze;
run;

proc anova data=work.mouse_maze;
	class color;
	model time=color;
	run;

/**
 * a) Estudia si este factor influye en el tiempo correspondiente:
 *
 * El factor color si que aporta razones para ser influyente según los
 * resultados obtenidos tras la comparación de medias de la variable
 * condicionadas al valor de la variable color. Esto se puede apreciar de
 * manera gráfica a través del box plot.
 *
 */
proc anova data=work.mouse_maze;
	class color;
	model time=color;
	means color/duncan;
run;

data a;
	f=Finv(0.95, 3-1, 15-(3-1)-1);
run;

proc print data=a;
run;

/**
 * b) Compara los tiempos medios asociados a los tres colores utilizando
 * distintos métodos y comenta los resultados:
 *
 * La media global para la variable tiempo es de 13.66, mientras que las
 * medias obtenidas tras la segmentación por la variable color se muestran a
 * continuación:
 *
 *	blk	->	8
 *	grn	->	22.2
 *	red	->	10.8
 *
 * Dichos resultados eran apreciables a travsé del box plot indicado
 * anteriormente. Sin embargo, tras la realización del test de igualdad de
 * medias se obtiene un valor de la F muy grande (20.01) comparado con el valor
 * crítico que (3.88529) lo cual hace que la hipotesis nula pueda ser
 * rechazada. Esto puede verse reflejado en el p-valor, que toma una
 * probabilidad muy baja (0.002).
 */

proc anova data=work.mouse_maze;
	class color;
	model time=color;
	means color/bon;
run;


/**
 * c) Supongamos  que el propósito del experimento es comprobar si el color 
 * verde tiene algún efecto especial. Realiza un contraste adecuado  para dicho
 * objetivo:
 * 
 * Se ha realizado un test de bonferroni, para conocer cuántas medias 
 * diferentes tiene dicha muestra. Tras examinar los resultados del test, se
 * puede apreciar que existen dos medias diferentes con índice de confianza del
 * 95%. El primer grupo se refiere a la categoría "verde" mientras que el 
 * segundo surge de la unión entre "negro" y "rojo". Como conclusión, y tras 
 * analizar los resultados, se puede aceptar la hipótesis de existencia de dos 
 * medias diferentes.
 */