/**
 * 
 * Title:
 * 	Statistical Computation - Exercise Set 1 - Exercise 5
 * 
 * Date:
 * 	February 2018
 * 
 * Authors:
 * 	Sergio Garcia Prado - https://garciparedes.me
 * 
 */


ods rtf file="/folders/myshortcuts/sas/sas-examples/data/bebes/BEBES.rtf"; 

libname bebes '/folders/myshortcuts/sas/sas-examples/data/bebes';

/**
 * 
 * a)
 * 
 */


proc contents data = bebes.pesobebes1 position;
run;


/* 63 observations and 10 variables */

/**
 * 
 * b)
 * 
 */


data bebes1;
	set bebes.pesobebes1;
run;

proc print data = bebes1;
run;

data bebes2;
	infile '/folders/myshortcuts/sas/sas-examples/data/bebes/PesoBebes-2.csv' delimiter=';';
	input v1 v3 v4 v5 v6 v7 v8 v9 v10 v11;
run;

proc print data = bebes2;
run;

data bebes3;
	infile '/folders/myshortcuts/sas/sas-examples/data/bebes/PesoBebes-3.dat' delimiter='09'x firstobs=2;
	input v1 v3 v4 v5 v6 v7 v8 v9 v10 v11;
run;

proc print data = bebes3;
run;


/**
 * 
 * c)
 * 
 */


data bebes.bebescompleto;
	set bebes1 bebes2 bebes3;
run;

data bebes.bebes;
	set bebes.bebescompleto;
run;

proc print data = bebes.bebes;
run;


/**
 * 
 * d)
 * 
 */

proc format;
	value raza 
		1 = '1-Blanca' 
		2 = '2-Negra' 
		3 = '3-Otras';
		
	value binaria 
		0 = '0-No' 
		1 = '1-Si';
run;

data bebes; 
	set bebes.bebes;
	label v1 = 'Código ID';
	label V3 = 'Edad madre';
	label V4 = 'Peso de la madre en la ultima menstruacion'; 
	label V5 = 'Raza madre';
	label V6 = 'Fumar durante el embarazo';
	label V7 = 'Embarazo prematuro';
	label V8 = 'Hipertensión';
	label V9 = 'Irritabilidad uterina';
	label V10 = 'Numero de visitas al medico';
	label V11 = 'Peso del bebé en gramos';
	format V5 raza. V6 binaria. V7 binaria. V8 binaria. V9 binaria.;
run;

proc print data = bebes label;
run;

/**
 * 
 * e)
 * 
 */

proc format;
	value pocopeso 
		0 = 'Superior a 2500g'
		1 = 'Inferior a 2500g';

data bebes;
	set bebes;
	if v11 < 2500 then do;
		POCOPESO = 1;
	end; else do;
		POCOPESO = 0;
	end;
	format POCOPESO pocopeso.;
run;

proc print data = bebes label;
run;


/**
 * 
 * f)
 * 
 */


proc means data = bebes;
	var POCOPESO;
run;


/**
 * 
 * g)
 * 
 */


proc univariate data = bebes;
	var V10;
run;

proc sgplot data = bebes;
	vbar V10;
run;


/**
 * 
 * h)
 * 
 */

proc sort data = bebes;
	by POCOPESO V6;
run;

proc univariate data = bebes;
	var V10;
	by POCOPESO;
run;

proc sgplot data = bebes;
	vbar V10 / group = POCOPESO;
run;

proc sort data = bebes;
	by V6;
run;

proc univariate data = bebes;
	var V10;
	by V6;
run;

proc sgplot data = bebes;
	vbar V10 / group = V6;
run;


/**
 * 
 * i)
 * 
 */


proc sgplot data = bebes;
	title 'Relación entre el Peso de los Bebes al Nacer y la edad de su Madre';
	scatter x = v3 y = V11;
run;


/**
 * 
 * j)
 * 
 */


proc tabulate data = bebes;
	class POCOPESO V10;
	table POCOPESO, V10;
run;

proc tabulate data = bebes;
	class POCOPESO V10;
	table POCOPESO, V10;
	by V6;
run;


/**
 * 
 * k)
 * 
 */

proc sgplot data = bebes;
	vbox V3 / group = V5;
run;


/**
 * 
 * l)
 * 
 */

ods rtf close; 