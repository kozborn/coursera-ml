function plotErrorVsLambda(xaxis, mJ, mJcv, mJTest) 
  figure; hold on;
  plot(xaxis, mJ, 'g');
  plot(xaxis, mJcv, 'r');
  plot(xaxis, mJTest, 'b');
  legend("J", "Jcv", "JTest");
  xlabel('lambda')
  ylabel('J(theta) Error')
  hold off;
endfunction
