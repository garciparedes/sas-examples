proc princomp data=work.olympicv2 out=work.oly outstat=work.oly_stats plots(unpack)=(scree pattern(vector) score matrix);
	var mts100--mts1500;
	id atleta;
run;


data villes2;
	if Agno = "Edition1991" then delete;
run;

proc princomp data=work.villes2 plots(unpack)=(scree pattern(vector) score matrix);
	var mts100--mts1500;
	id atleta;
run;