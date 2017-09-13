OPTIONS PS=58 LS=72 NODATE NONUMBER; 

DATA stocks;
	set SASHELP.STOCKS;
RUN;

PROC PRINT data = stocks NOOBS;
	title 'The Stocks data set';
RUN;	