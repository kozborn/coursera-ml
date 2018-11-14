function [J, grad] = costFunction(X, y, t, lambda)
  
   [m, n] = size(X);

   J = (1/(2*m)) * (H(X, t) - y)'*(H(X, t) - y) + lambda/(2*m)*sum(t(2:end).^2);

   grad = (1/m) * X' * (H(X, t) -y);

   regGrad = (lambda/m).*t;
   regGrad(1) = 0;
   grad = grad + regGrad;

endfunction
