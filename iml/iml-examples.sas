/* 
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Análisis de Datos
 * Year: 2017/18
 * Teacher: Miguel Alejandro Fernández Temprano
 * 
 */

*Ejemplos para primera clase de IML;
proc iml;

/**********************************************/
/* Entrada manual de varios tipos de matrices */ 
/**********************************************/

/* 
 * escalar
 */
s = 1; 

/* 
 * 2 x 3 matriz numérica
 */
x = {
	1 2 3,
	4 5 6
};

/* 
 * 1 x 2 matriz de texto
 */
y = {
	"male" "female"
}; 

/* 
 * Matriz 3 x 2 de 1s
 */
z = J(3,2,1); 

/* 
 * Repite el vector (1 2 3) en 4 filas y 2 colunnas
 * 
 */
t = repeat({1 2 3},4,2);


/* 
 * Si no se pone comas, el print es de una única tabla con todos los 
 * datos, mientras que si se pone comas, entonces se hace en una 
 * tabla diferente. 
 */
print s x y z, t;

/* 
 * Dimensiones de las matrices
 */
n=nrow(t);
p=ncol(t);
dim=dimension(t);

print dim;

/* 
 * Cambio de forma de las matrices
 */
t2=shape(t,3,8);

print t2;

/* 
 * Adicción de columnas
 */
t3 = t || {4, 5, 6, 7};
print t3;

/* 
 * Adicción de filas
 */
t4 = t // {4 5 6 7 8 9};
print t4;


/***************************************/
/* Operaciones con matrices y vectores */
/***************************************/

u = {1 2}; 
v = {3 4}; 

/* 
 * Operaciones elemento a elemento 
 * suma: 			+ 
 * resta:			-
 * producto:	# 
 * división:	/
 * exp:				##
 */

w = 2 * u - v; /* w = {-1 0} */

w2 = u # v;

w3 = v ## 3;

print w, w2, w3;


/* 
 * Operaciones matriciales
 * producto:	*
 */
u2 = {
	1 2, 
	3 4
};

v2 = {
	5,
	6
};

s = u2 * v2;

print s;

/* 
 * Operaciones mixtas
 */

x = {
	-4 9, 
	2 5, 
	8 7
};

media = {
	2 7
};

std = {
	6 2
};

/* 
 * resta media[j] de la columna j
 */
center = x - media; 

/* 
 * divide la columna j por std[j]
 */
stdX = center / std;  
print stdX; 


/*********************************/
/* Filas, columnas y submatrices */
/*********************************/

A = {
	1 2 3, 
	4 5 6, 
	7 8 9, 
	10 11 12
}; 

/* 
 * segunda fila *
 */
r = A[2, ]; 

/* 
 * intersección de las filas y columnas especificadas *
 */
m = A[3:4, 1:2]; 

print A, r, m; 

/* También sirve para asignaciones */

/* 
 * asigna NA al elemento
 */
A[2, 1] = .;

/* 
 * asigna 0 a todos estos elementos
 * 
 */
A[3:4, 1:2] = 0;

/* 
 * asigna elementos en la forma vectorial de la matriz
 */
A[{1 5 9}] = {-1 -2 -3}; 
print A;


/*******************************************/
/* Lectura y creación de ficheros de datos */
/*******************************************/

/* 
 * Lectura de datos de un SAS data set en vectores o en una matriz
 */
varNames={
	"mts100" "longitud" "peso" "altura" "mts400" "vallas110" "disco" 
	"pertiga" "jabalina" "mts1500" "puntos" "atleta"
};


use work.Olympicv2;

/* 
 * De esta manera cada variables es un vector
 */
read all var varNames;
close work.Olympicv2;
print mts100 atleta;

var2={"atleta"};

use work.Olympicv2;

read all var var2;

/* 
 * Esto lee todas las variables caracter en la matriz label
 */
read all var _CHAR_ into label;

/* 
 * Así todas las variables numéricas están en una matriz
 */

read all var varNames into A;
close work.Olympicv2;

print A;
print atleta label;
print A[c=varNames r=atleta];

/* 
 * Salida de una matriz a un SAS data set
 */
create work.out from A;
append from A;
close work.out;

/*******************************************/
/* Programación muy elemental en IML       */
/*******************************************/


/* 
 * Bucles en IML (en este caso innecesarios)
 */


/* 
 * Cálculo de las medias de las columnas de una matriz
 */

/* definición de vector para guardar resultados */
results = j(1, ncol(A)); 

/* bucle por columnas */
do j = 1 to ncol(A); 
	sum = 0;
	/* bucle por filas */
	do i = 1 to nrow(A); 
		/* suma por columnas */
		sum = sum + A[i,j]; 
	end;
	results[j] = sum / nrow(A); /* media de columna j */
end;

print results;


/* 
 * Algunas operaciones sobre la matriz
 */
/*
 *  suma por columnas
 */
A2 = A[+,];

/*
 * media por columnas
 */
A3 = A[:,];

/*
 * suma de cuadrados por filas
 */
A4 = A[,##];

print A3[c=varNames];



/* 
 * Definición de funciones en IML
 */

/* 
 * Estandardización de cada columna de la matriz x
 */
start Stdize(x);
	return( (x - mean(x)) / std(x) );
finish;

z = Stdize(A);

print z; 

/* 
 * Llamada a un proc de SAS
 */
submit; 

proc means data=work.out noprint;
	var col1-col11; 
	output 
		out=work.out2 
		Mean=media1-media11; 
run; 

endsubmit;

/* 
 * Lectura de resultados
 */
use work.out2; 
read all into Media; 
close work.out2;
print Media;

quit;
