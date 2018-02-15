/**
 * 
 * Title:
 * 	Statistical Computation - Exercise Set 1 - Exercise 1
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
 * 
 * Create "coches" data set.
 */

data coches_v1;
	input Model $ Year Company $ Seats Color $;
	if Year < 1970 then do;
		Type = "clasico";
	end;
	else do;
		Type = "normal";
	end;
	datalines;
	Corvette 1955 . 2 negro
	XJ6 1985 Jaguar 2 gris
	Mustang 1966 Ford 4 rojo
	Miata 1992 . . plateado
	CRX 1991 Honda 2 negro
	Camaro 1990 . 4 rojo
	;
run;

proc print data=coches_v1;
run;


/**
 * b)
 * 
 * Add "Chevrolet" to missing only "company" values.
 */

data coches_v2;
	set coches_v1;
	if missing(Company) and not missing(Seats) then do;
		Company = "Chevrolet";
	end;
run;

proc print data = coches_v2;
run;


/**
 * c)
 * 
 * Add 2 and "Mazda" to missing values on "seats" and "company".
 */

data coches_v3;
	set coches_v2;
	if missing(Company) and missing(Seats) then do;
		Company = "Mazda";
		Seats = 2;
	end;
run;

proc print data = coches_v3;
run;