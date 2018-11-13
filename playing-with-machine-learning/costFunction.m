function [J, grad] = costFunction(X,y, t)
  
   [m, n] = size(X);
   
   J = (1/(2*m)) * (H(X,t) - y)'*(H(X,t) - y);
   grad = (1/m) * X' * (H(X,t) -y);
endfunction
