function loadCDRData()
  csvread('2000cdr.csv');
  X = [ones(size(ans,1),1), ans];
  Y = [X(:,end)];
  X(:, end) = [];
  X;
  Y;
  initial_theta = zeros(size(X,2), 1);
  J = costFunction(X,Y,initial_theta)
  fprintf("Normal Equation \n");
  t = normalEquation(X,Y)
  J = costFunction(X,Y,t)
  %  Set options for fminunc
  options = optimset('GradObj', 'on', 'MaxIter', 400);
  %  Run fminunc to obtain the optimal theta
  %  This function will return theta and the cost 
  [theta, cost] = ...
	  fminunc(@(t)(costFunction(X, Y, t)), initial_theta, options);
   fprintf("Fminunc \n");
   theta
   cost
  
endfunction
