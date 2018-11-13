function [t] = normalEquation(X,y)
  t = pinv(X'*X) * X'*y;
endfunction
