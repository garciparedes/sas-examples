/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Regresión y ANOVA
 * Year: 2017/18
 * Teacher: Lourdes Barba Escribá
 *
 */

/*
 * SE TRATA DE VER SI EL TIPO DE EMPAQUETADO INFLUYE EN LAS VENTAS DE CIERTOS CEREALES (Y).
 * Se eligieron inicialmente 20 tiendas, de similares caracter?sticas, como uds. experimentales,
 * asignando al azar cada tipo de empaquetado a cinco de ellas, pero una se incendió durante el estudio.
 *
 * Se procuró que las condiciones de venta fueran similares en todos los casos;
 */

data kenton;
	infile '/folders/myshortcuts/sas-examples/data/CH16TA01.txt';
	input y package store;

proc print ;
run;

proc sgplot ;
	scatter y=y x=package;
run;

proc boxplot ;
	*el data set debe estar ordenado segun el factor;
	plot y*package;
run;

proc anova ;
	class package;
	model y=package;
	means package;
	run;
	*Homogeneidad de varianzas (Levene);

proc anova ;
	class package;
	model y=package;
	means package/hovtest;
	*HOVTEST=BARTLETT ;
	*WELCH, realiza un anova con varianzas ponderadas;
	run;
	
	*PARA obtener INTERVALOS de c.INDIVIDUALES  DE LA T (LSD) o simultaneos con BON;
	means package/T BON CLM;
	*alpha=0.04 ;
	run;
	
	*I. C. para Diferencias DE MEDIAS;
	means package/t cldiff;
	run;
	
	means package/ LSD TUKEY BON SCHEFFE;
	*  CLDIFF ;
	*(por defecto, incompatible con DUNCAN) ALPHA=0.01 */;
	run;
	
	means package/ DUNNETT ('2');
	*si queremos fijar el 'control;
	run;
	
	*comparacion de medias;
	means package/ DUNCAN SNK;
	* LINES;
	run;
	
	/*
	 * ordena las medias de menor a mayor uniendo las que no son 
	 * significativamente diferentes, opcion por defecto con  DUNCAN, 
	 * incompatible con DUNNETT;
	 */
	means package/ LSD DUNCAN SNK TUKEY BON SCHEFFE LINES alpha=0.02;
	run;
	
*CONTRASTES;
proc glm data=kenton;
	class package;
	model y=package/clparm;
	* se obtiene I.C. para el contraste pedido;
	contrast '3c contra 5c' package .5 .5 -.5 -.5;
	estimate '3c contra 5c' package .5 .5 -.5 -.5;
	run;
	
*residuos;
proc glm data=kenton;
	class package;
	model y=package;
	output out=resal p=pred r=res student=rst;

proc print data=resal;
run;

proc sgplot ;
	scatter x=pred y=res;	
run;

proc sgplot ;
	scatter x=pred y=rst;
run;

proc univariate plot normal data=resal;
	var res;
	*qqplot;
	*probplot;
run;

*para detectar dependencia entre observaciones consecutivas;
data a;
	set resal;
	num=_n_;
run;

proc print data=a;
run;

proc sgplot ;
	scatter y=y x=num;
run;
proc sgplot ;
	scatter y=res x=num;
run;

proc sgplot ;
	scatter y=rst x=num;
run;