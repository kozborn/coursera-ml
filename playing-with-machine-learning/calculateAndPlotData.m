function calculateAndPlotData(X,y)
  
  mJ = [];
  mJcv = [];
  mJTest = [];
  
  [J Jcv JTest theta] = computations(X, y);
  
  mJ = [mJ J];
  mJcv = [mJcv Jcv];
  mJTest = [mJTest JTest];

  fprintf("\n \n")
  plotData(X, y, theta);
  theta = theta'
  
  mJ
  mJcv
  mJTest
  plotErrorVsPolyDegree(mJ, mJcv, mJTest)
endfunction
