function loadCDRData()
  data = csvread('all2.csv');
  % preparing data for calculation
  % features are taken from day 1 to end - 1 
  X = [ones(size(data, 1) -1, 1) data(1:end -1 , 1:end)];
  Y = data(2:end, end);
  
  initialX = X;
 

  calculateAndPlotData(X, Y);
  
  X = [X, X(:,2).^2, X(:,3).^3];
  
  calculateAndPlotData(X, Y);
  

  
endfunction
