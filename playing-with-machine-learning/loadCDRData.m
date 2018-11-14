function loadCDRData()
  data = csvread('10cdr.csv');
  % preparing data for calculation
  % features are taken from day 1 to end - 1 
  X = [ones(size(data, 1) -1, 1) data(1:end -1 , 1:end -1)]
  Y = data(2:end, end);
  fprintf("D = 1 \n")
  computations(X, Y);
  fprintf("\n \n")

  fprintf("D = 2 \n")
  X = [X X(:,2).^2]
  computations(X, Y);
  fprintf("\n \n")

  fprintf("D = 3 \n")
  X = [X X(:,3).^3]
  
  computations(X, Y);
  fprintf("\n \n")

  fprintf("D = 4 \n")
  X = [X X(:,4).^4]
  
  computations(X, Y);
  fprintf("\n \n")
  
  fprintf("D = 5 \n")
  X = [X X(:,5).^5]
  
  computations(X, Y);
  fprintf("\n \n")
  % t = normalEquation(X,Y)
  % J = costFunction(X,Y,t)

  
  
endfunction
