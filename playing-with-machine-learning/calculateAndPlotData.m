function calculateAndPlotData(X,y)
  
  mJ = [];
  mJcv = [];
  mJTest = [];

  [m, n] = size(X);
  figure; hold on;

  xaxis = [1:m];
  xlabel("Dates");
  ylabel("Closing price")
  plot(xaxis, y, 'k');

  lambdaAxis = []

  % for i=0:10
  %   lambda = i + 0.2
  %   lambdaAxis = [lambdaAxis lambda]
  %   [X, rangeV, meanV] = featureScalling(X);

  %   [J Jcv JTest theta] = computations(X, y, lambda);
    
  %   mJ = [mJ J];
  %   mJcv = [mJcv Jcv];
  %   mJTest = [mJTest JTest];

  %   H = predict(X, theta);
  %   redCh = rand()
  %   greenCh = rand()
  %   blueCh = rand()
  %   leg = sprintf("L %f", lambda);

  %   plot(xaxis, H, 'DisplayName', leg, 'color', [redCh, greenCh, blueCh], 'lineWidth', 1);

  % endfor
  % hold off;
  % legend show;

  % mJ
  % mJcv
  % mJTest
  % plotErrorVsLambda(lambdaAxis, mJ, mJcv, mJTest)

endfunction
