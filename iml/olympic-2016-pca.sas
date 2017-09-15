proc iml ;
	datasetNames = {
	"mts100" "longitud" "peso" "altura" "mts400" "vallas110" "disco" "pertiga" 
		"jabalina" "mts1500" "puntos" "atleta"
	};
	
	use work.Olympic;

	read all var _CHAR_ into label;

	read all var datasetNames into dataset;

	close work.Olympic;
	
	A = dataset[,1:10];
	
	print dataset label;
	
	X = (A - mean(A)) / std(A);
	
	Y = (X` * X) / (nrow(X) -1);
	
	autvalue = eigval(Y);
	eigvalue = eigvec(Y);
	
	score = X * eigvalue;

	xy = score[,1:2];
	print xy;
	
	* print score;
	* print eigvalue;
	print autvalue;
	

	run scatter(score[,1], score[,2], label, label) label = {"CP1" "CP2"};
	