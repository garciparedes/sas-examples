proc iml ;
	datasetNames = {
	"mts100" "longitud" "peso" "altura" "mts400" "vallas110" "disco" "pertiga" 
		"jabalina" "mts1500" "puntos" "atleta"
	};
	
	xNames = {
	"mts100" "longitud" "peso" "altura" "mts400" "vallas110" "disco" "pertiga" 
		"jabalina" "mts1500"
	};
	
	
	use work.Olympic;

	read all var _CHAR_ into label;
	read all var datasetNames into dataset;

	close work.Olympic;
	
	A = dataset[,1:10];
	
	
	* print dataset;

	A = (A - mean(A)) / std(A);
	
	Y = (A` * A) / (nrow(A) -1);
	
	print Y;
	autvalue = eigval(Y);
	eigvalue = eigvec(Y);
	
	score = A * eigvalue;
	
	print score;
	
	print eigvalue, autvalue;
	
	run scatter(score[1,], score[2,], label, label);
	