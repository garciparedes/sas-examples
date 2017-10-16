/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Análisis de Datos
 * Year: 2017/18
 * Teacher: Miguel Alejandro Fernández Temprano
 *
 */


title 'PROC CORRESP Table Construction';

data Neighbor;
	input Name $ 1-10 Age $ 12-18 Sex $ 19-25 Height $ 26-30 Hair $ 32-37;
	datalines;
Jones      Old    Male   Short White
Smith      Young  Female Tall  Brown
Kasavitz   Old    Male   Short Brown
Ernst      Old    Female Tall  White
Zannoria   Old    Female Short Brown
Spangel    Young  Male   Tall  Blond
Myers      Young  Male   Tall  Brown
Kasinski   Old    Male   Short Blond
Colman     Young  Female Short Blond
Delafave   Old    Male   Tall  Brown
Singer     Young  Male   Tall  Brown
Igor       Old           Short
;

proc corresp data=Neighbor dimens=1 observed short;
	title2 'Crostabulación Simple';
	ods select observed;
	tables Sex, Age;
run;

proc corresp data=neighbor observed short binary;
	title2 'Codificación Binaria';
	ods select binary;
	tables Hair Height Sex Age;
run;

proc corresp data=neighbor observed short;
	title2 'Codificación Binaria';
	ods select observed;
	tables Name, Hair Height Sex Age;
run;

proc corresp data=neighbor observed short dimens=1;
	title2 'Crostabulación Múltiple';
	ods select observed;
	tables Hair, Height Sex;
run;

proc corresp data=Neighbor cross=row observed short;
	title2 'Crostabulación Múltiple con filas cruzadas';
	ods select observed;
	tables Hair Height, Sex Age;
run;

proc corresp data=Neighbor cross=row observed short dimens=1;
	title2 'Crostabulación Múltiple con filas cruzadas y columnas suplementarias';
	ods select observed supcols;
	tables Hair Height, Sex Age;
	supplementary Age;
run;

proc corresp data=Neighbor cross=row observed short;
	ods output Observed=Obs(drop=Suma);
	tables Hair Height, Sex Age;
run;
