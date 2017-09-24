/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Análisis de Datos
 * Year: 2017/18
 * Author: Sergio García Prado (garciparedes.me)
 * Name: Práctica 01
 *
 */

proc iml ;

	/**
	 * Importar los datos a SAS desde el fichero Olympic2016 v2.txt;
	 */

	datasetNames={
	"mts100" "longitud" "peso" "altura" "mts400" "vallas110" "disco" "pertiga"
		"jabalina" "mts1500" "puntos" "atleta"
	};
	use work.olympicv2;
	read all var _NUM_ into A[c=datasetNames];
	close work.olympicv2;
	print A;

	/**
	 * Efectuar mediante IML un ACP normado con los datos de las 10 pruebas.
	 */

	X = A[,1:10];

	X_norm = (X - mean(X)) / std(X);

	X_star = (X_norm` * X_norm) / (nrow(X_norm) - 1);

	X_star_autval = eigval(X_star);
	X_star_autvec = eigvec(X_star);


	/**
	 * Calcular los scores en las 10 componentes y comprobar que tienen media 0
	 * y varianza igual al autovalor correspondiente.
	 */

	S = X_norm * X_star_autvec;

	S_mean = mean(S)`;
	print S_mean;

	S_var = std(S)` ## 2;
	print S_var, X_star_autval;

	/**
	 * Calcular las contribuciones absolutas y relativas de los puntos a las
	 * componentes y hacer la representación gráfica correspondiente.
	 */
	print X_norm, X_star_autval;

	X_star_CA = ((X_norm * X_star_autvec) ## 2 ) / ( (nrow(X_norm)-1) * X_star_autval`);
	print X_star_CA;

	* p = X_star_CA[+,];
	* print p;

	X_star_CR = ((X_norm * X_star_autvec) ## 2 ) / (X_norm ## 2)[,+];
	print X_star_CR;

	* p = X_star_CR[,+];
	* print p;

	cr = s[,1:2] || X_star_CR[,1:2][,+];
	create work.cr from cr;
	append from cr;
	close work.cr;

	print cr;
	submit;
		proc sgplot data=work.cr;
			bubble size=col3 X=col1 Y=col2;
		run;
	endsubmit;


	/**
	 * Considerar ahora la nube de los puntos columna y calcular los autovalores y
	 * autovectores correspondientes. Comprobar las relaciones con los resultados
	 * de la nube de puntos fila.
	 */


	X_vars_star = (X_norm * X_norm`) / (nrow(X_norm) - 1);

	X_vars_star_autval = eigval(X_vars_star)[1:10,];
	X_vars_star_autvec = eigvec(X_vars_star)[,1:10];

	print X_vars_star_autval, X_vars_star_autvec;


	X_vars_star_autvec_2 = (X_norm*X_star_autvec)/(((nrow(X_norm)-1) * X_star_autval)` ## 0.5);
	print X_vars_star_autvec_2;

	X_star_autvec_2 = (X_norm`*X_vars_star_autvec)/(((nrow(X_norm)-1) * X_vars_star_autval)` ## 0.5);
	print X_star_autvec_2;
	print X_star_autvec;

	*X_star_autvec_2 = (X_norm`*X_vars_star_autvec)/((nrow(X_norm) -1) *X_vars_star_autval` ## 0.5);
	*print X_star_autvec_2;

	/**
	 * Calcular las proyecciones de las variables (scores) en los nuevos ejes.
	 * Calcular sus medias, sus varianzas y la suma de sus cuadrados (dividida por n-1).
	 */

	/**
	 * Reconstruir la matriz de datos original a partir de los autovalores y autovectores.
	 */

	/**
	 * Reconstruir la matriz con las dos primeras componentes principales y valorar la pérdida.
	 */
