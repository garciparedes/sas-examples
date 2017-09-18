proc iml ;
	
	use SASHELP.CARS;

	read all var _CHAR_ into label;

	read all var _NUM_ into A;

	close SASHELP.CARS;
	
	*print A label;
	
	X = (A - mean(A)) / std(A);
	X[ loc( X = . ) ] = 0;
	
	*print X;
	
	Y = (X` * X) / (nrow(X) -1);
	
	autvalue = eigval(Y);
	eigvalue = eigvec(Y);
	
	score = X * eigvalue;

	xy = score[,1:2];
	* print xy;
	
	* print score;
	* print eigvalue;
	* print autvalue;
	

	run scatter(score[,1], score[,2], label[,3]) 
								label = {"CP1" "CP2"} 
								grid= {X Y};
	