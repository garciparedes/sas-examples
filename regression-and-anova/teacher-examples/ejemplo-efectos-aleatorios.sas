/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Regresión y ANOVA
 * Year: 2017/18
 * Teacher: Lourdes Barba Escribá
 *
 */

* Se trata de estudiar el posible efecto del profesorado en la nota final
obtenida por los estudiantes de un cierto nivel de enseñanza.
Se seleccionan 28 estudiantes de similares características y aptitudes al
comienzo del curso, y se reparten al azar entre  4 profesores, también elegidos
también al azar entre todos los profesores de dicho nivel;
*IMPORTAMOS  el conjunto de datos datatab_6_26.xls como teacher;
*declaramos un efecto aleatorio y pedimos el test basado en las sumas de cuadrados;

proc import out=teacher
	datafile='/folders/myshortcuts/sas-examples/data/regression-and-anova/datatab_6_26.xls'
	dbms=XLS;
RUN;

proc glm ;
	class teacher;
	model score=teacher;
	random teacher / test;
	run;
quit;

*No podemos rechazar la hipótesis HO: s2(t)= 0, así pues no podemos concluir
que haya diferencias entre profesores,
y no tiene mucho sentido estimar s2(t) pero vemos como se hace.
227.75 = Var(Error) + 7 Var(teacher) = s2 + 7. s2(t)
88.321429= Var(Error) = ^s2
Despejando se obtiene ^s2(t)= 19.9.
(No se rechaza que sea nulo por la gran dispersión de los estimadores de la
varianza, al no ser una muestra grande);
