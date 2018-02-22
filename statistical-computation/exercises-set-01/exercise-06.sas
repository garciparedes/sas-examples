/**
 * 
 * Title:
 * 	Statistical Computation - Exercise Set 1 - Exercise 6
 * 
 * Date:
 * 	February 2018
 * 
 * Authors:
 * 	Sergio Garcia Prado - https://garciparedes.me
 * 
 */


/**
 * a)
 */


libname encuesta "/folders/myshortcuts/sas/sas-examples/data/a_corto";


/**
 * b)
 */


filename f1 "/folders/myshortcuts/sas/sas-examples/data/a_corto/a_corto.txt";

data encuesta.corto;
	infile f1 delimiter='09'x firstobs = 2 missover;
	input agno encuesta sexo $ km resi $ tiempo;
run;
	
	
proc print data = encuesta.corto;
run;

proc contents data = encuesta.corto;
run;

/**
 * c)
 */


filename f2 "/folders/myshortcuts/sas/sas-examples/data/a_corto/a_corto_2008_2009.txt";

data encuesta.corto0809;
	infile f2 delimiter = '09'x firstobs = 2;
	input agno encuesta sexo $ km resi $ tiempo;
run;

proc append base = encuesta.corto data = encuesta.corto0809; 
run;

proc print data = encuesta.corto;
run;

proc contents data = encuesta.corto;
run;


/**
 * d)
 */


filename f3 "/folders/myshortcuts/sas/sas-examples/data/a_corto/a_mas.txt";

data encuesta.mas;
	infile f3 delimiter = '09'x firstobs = 3;
	input agno estudios_previos $ edad altura peso numero_pie cigarrillos alcohol $;
run;

proc print data = encuesta.mas (obs = 10);
run;

proc contents data = encuesta.mas;
run;


/**
 * e)
 */

data encuesta.todo;
	merge encuesta.corto encuesta.mas;
	by agno;
run;

proc print data = encuesta.todo;
run;



/**
 * f)
 */

proc sort data = encuesta.todo;
	by resi;
run;

proc tabulate data = encuesta.todo;
	class resi;
	table resi;
run;


/**
 * g)
 */




/**
 * h)
 */




/**
 * i)
 */




/**
 * j)
 */




/**
 * k)
 */




/**
 * l)
 */




/**
 * m)
 */



