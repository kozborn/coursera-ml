function loadProcadData()
  data = csvread('prd.csv');
  % preparing data for calculation
  % features are taken from day 1 to end - 1 
  X = [ones(size(data, 1) -1, 1) data(1:end -1 , 1:end)];
  Y = data(2:end, end);
 
  calculateAndPlotData(X, Y);
  
  % after above I choose lamba 2
  [m, n] = size(X);
  figure; hold on;

  xaxis = [1:m];
  xlabel("Dates");
  ylabel("Closing price")
  plot(xaxis, Y, 'color', 'r', 'DisplayName', 'Closing prices', 'lineWidth', 1.5);

  lambda = 0
  [J Jcv JTest theta] = computations(X, Y, lambda);
  H = predict(X, theta);
  redCh = rand()
  greenCh = rand()
  blueCh = rand()
  leg = sprintf("Predictions with L %f", lambda);

  plot(xaxis, H, 'DisplayName', leg, 'color', [redCh, greenCh, blueCh], 'lineWidth', 1);
  legend show;
  hold off;
  
endfunction
