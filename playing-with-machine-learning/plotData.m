function plotData(X, Y, theta)

  [m, n] = size(X);
  figure; hold on;
  H = predict(X, theta);
  xaxis = [1:m];
  plot(xaxis, Y);
  plot(xaxis, H);
  legend("Results", "Predictions");
  xlabel("Dates");
  ylabel("Closing price");
  hold off;
endfunction
