/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Análisis de Datos
 * Year: 2017/18
 * Author: Sergio García Prado (garciparedes.me)
 * Name: Análisis de Correspondencias - Práctica 01
 *
 */

proc iml;
	
	use work.saludbyedadysexo;

	read all var _CHAR_ into row_names;
	read all var _NUM_ into N;

	print(N);
	/**
	 * 1)	Construir las matrices F, Dr, Dc y las matrices de puntos fila y columna.
	 */

	F = N / N[+,+];
	print(F);
	
	Dr = diag(N[,+] / N[+,+]);
	print(Dr);
	
	Dc = diag(N[+,] / N[+,+]);
	print(Dc);
	
	Pr = inv(Dr) * F;
	print(Pr);
	
	Pc = inv(Dc) * F`;
	print(Pc);
	
	
	
	/**
	 * 2)	Calcular las distancias chi-cuadrado entre los tres puntos fila.
	 */
   chi_sqrt = ((N - N[,+]*N[+,]/N[+,+])##2 / (N[,+]*N[+,]/N[+,+]))[+,+];
   print(chi_sqrt);
	

	/**
	 * 3)	Calcular el valor del estadístico chi-cuadrado
	 */


	/**
	 * 4)	Calcular la inercia total como la suma ponderada de las distancias 
	 * 		chi-cuadrado al centro de gravedad de los puntos fila y comprobar que es 
	 * 		el estadístico chi-cuadrado dividido por n.
	 */
	
	/**
	 * 5)	Construir la matriz a diagonalizar, diagonalizarla calculando los 
	 * 		autovalores y autovectores unitarios
	 */
	
	X = F` * inv(Dr) * F * inv(Dc);
	print(X);
	
	X_lambda = eigval(X)[,1];
	print((X_lambda[+]-1) * N[+,+]);
	X_u_1 = eigvec(X);
	X_u_norm = vecdiag(X_u_1` * inv(Dc) * X_u_1);
	print(X_u_norm);
	X_u = (X_u_1` / (X_u_norm) ## 0.5)`;
	
	fact = inv(Dc) * X_u;
	print(fact);
	
	Proyec_r = Pr * fact;
	Proyec_c = (fact` # (X_lambda ## 0.5))`;
	
	print(Proyec_r);
	print(Proyec_c);
	
	Proyec = Proyec_r // Proyec_c;
	print(Proyec);
	col_names = {'MM', 'M', 'R', 'B', 'MB'};
	names = row_names //col_names ;
	/**
	 * 6)	Calcular los factores y las proyecciones de los puntos fila sobre los 
	 * 		ejes.
	 */
	
	
	/**
	 * 7)	Calcular las distancias euclídeas entre las proyecciones y compararlas 
	 * 		con las del punto 3.
	 */
	
	
	/**
	 * 8)	Calcular los factores y las proyecciones de los puntos columna sobre los 
	 * 		ejes.
	 */
	
	
	/**
	 * 9)	Efectuar una representación conjunta de las proyecciones de filas y 
	 * 		columnas.
	 */
	
	run Scatter(Proyec[,2], Proyec[,3], names, names );

