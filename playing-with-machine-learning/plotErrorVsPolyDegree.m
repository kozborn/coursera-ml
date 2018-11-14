function plotErrorVsPolyDegree(mJ, mJcv, mJTest) 
  figure; hold on;
  d = [1: size(mJ, 2)];
  plot(d, mJ, 'g');
  plot(d, mJcv, 'r');
  plot(d, mJTest, 'b');
  legend("J", "Jcv", "JTest");
  xlabel('Polynomial degree')
  ylabel('J(theta) Error')
  hold off;
endfunction
