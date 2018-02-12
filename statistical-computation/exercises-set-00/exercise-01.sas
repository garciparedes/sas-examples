
/**
 * Import dataset (by libname linking)
 */
libname cabezas '/folders/myshortcuts/sas/sas-examples/data/cabezas/';

proc print data=cabezas.cabezas1 (obs=10);
run;


/**
 * Get Number of Variables, Variable Names and Number of Observations
 */
proc contents data=cabezas.cabezas1;
run;

/**
 * Copy dataset to working lib
 */
data cabezas1;
	set cabezas.cabezas1;
run;

data otrocabezas;
	set cabezas.cabezas1;
run;

proc print data=cabezas1 (obs=10);
run;

proc print data=otrocabezas (obs=10);
run;

/**
 * Save Dataset as txt file
 */
data cabezas_txt;
	set cabezas.cabezas1;
	file '/folders/myshortcuts/sas/sas-examples/data/cabezas/cabezas1.txt';
	put _all_;
run;