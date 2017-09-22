/* 
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Regresión y ANOVA
 * Year: 2017/18
 * Teacher: Lourdes Barba Escribá
 * 
 */



*SE TRATA DE VER si hay diferencias entre 5 medicamentos para la hepatitis. ;

data hepatitis;
	input medicamento $ tiempo;
	cards;
	A 8.3
	A 7.6
	A 8.4
	A 8.3
	B 7.4
	B 7.1
	C 8.1
	C 6.4
	D 7.9
	D 9.5
	D 10.0
	E 7.1
	;

proc print ;
run;

/*proc gplot;
plot tiempo *medicamento;
run;*/
proc sgplot ;
	scatter y=tiempo x=medicamento;
run;

proc boxplot ;
	*aqui no tiene mucho sentido;
	plot tiempo *medicamento;
run;

*LO ESENCIAL:;

proc anova ;
	class medicamento;
	model tiempo=medicamento;
	run;
	*valor critico a nivel 0.05;

data a;
	f=Finv(0.95, 4, 7);

proc print ;
run;