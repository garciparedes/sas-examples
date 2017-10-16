/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Análisis de Datos
 * Year: 2017/18
 * Teacher: Miguel Alejandro Fernández Temprano
 * 
 */

proc iml;
use work.olympic;
read all into A[c=colnames r=atleta];
close work.olympic;
print A;

* Se elimina la variable puntos;
A=A[,1:10];

* Centrado de los datos;
uno=J(nrow(A),1,1);
media=mean(A);
aux=uno*media;
A2=A-aux;
A3=A-media; *Equivalente al anterior. No es necesario aux ni uno;

*Análisis de las covarianzas;
Y=(A3`*A3)/(nrow(A3)-1);
autoval=eigval(Y);
autovec=eigvec(Y);
scorespc1=A3*autovec[,1];
scorespc=A3*autovec;

print Y;
print autoval autovec;
print scorespc;

*Graficos;
title "Dos primeras componentes principales";
run Scatter(scorespc[,1], scorespc[,2]) datalabel=atleta label={pc1,pc2};

title "Pesos de las variables en las dos primeras componentes principales";
run Scatter(autovec[,1], autovec[,2]) datalabel=colnames label={componente1, componente2};


/*********************************************/
/* Ejercicios */
/*********************************************/

* 1. Comprobar que la suma de los cuadrados de los scores en cada componente divididos por n-1 son iguales a los autovalores ;
* 2. Comprobar que las medias de los scores son 0, es decir que el gráfico de los puntos está centrado en 0;
* 3. Comprobar que la inercia total es igual a la suma de los autovalores;
* 4. Construir una matriz que tenga en la primera columna los autovalores, en la segunda el porcentaje de inercia explicado por cada autovalor,
     en la tercera los autovalores acumulados hasta la fila correspondiente y en la cuarte el porcentaje acumulado;
* 5. Elaborar un scree plot con los autovalores;
* 6. Calcular las contribuciones absolutas y relativas de los puntos;
* 7. Hacer un diagrama de burbujas en los que se representen los scores en las dos primeras componentes y como grosor de las burbujas las contribuciones absolutas a cada eje;
* 8. Hacer un diagrama de burbujas en los que se representen los scores en las dos primeras componentes y como grosor de las burbujas las suma de las contribuciones relativas a los dos ejes;


****************************************************************************;
* Con las correlaciones;
****************************************************************************;

A4=(A-mean(A))/std(A);
Y2=(A4`*A4)/(nrow(A)-1); * Matriz de correlaciones;
print Y2;

*Análisis;
autoval=eigval(Y2);
autovec=eigvec(Y2);
scorespc1=A4*autovec[,1];
scorespc=A4*autovec;
print autoval,autovec;
print scorespc;

title "Dos primeras componentes principales";
run Scatter(scorespc[,1], scorespc[,2]) datalabel=atleta label={pc1,pc2};

title "Pesos de las variables en las dos primeras componentes principales";
run Scatter(autovec[,1], autovec[,2]) datalabel=colnames label={componente1, componente2};

/*********************************************/
/* Ejercicios */
/*********************************************/

* Ejecutar el código hecho en los ejercicios anteriores para el caso de las correlaciones y comprobar los resultados;

quit iml;
