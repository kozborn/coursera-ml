function [X] = featureScalling(X)
  [m, n] = size(X);
  
  for i=2:n
    r = range(X(:,i));
    me = mean(X(:,i));
    X(:, i) = (X(:,i) - me) / r;
  endfor
  X;
endfunction
