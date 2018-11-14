function plotErrorVsPolyDegree(err) 
  d = [1: size(err, 2)];
  figure; hold on;
  plot(d, err);
  xlabel('Polynomial degree')
  ylabel('J(theta) Error')
endfunction
