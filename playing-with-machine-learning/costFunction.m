function [J, grad] = costFunction(X, y, t, lambda)
  
   [m, n] = size(X);

   J = (1/(2*m)) * sum((predict(X, t) - y).^2) + lambda/(2*m)*sum(t(2:end).^2);

   grad = (1/m) * X' * (predict(X, t) -y);

   regGrad = (lambda/m).*t;
   regGrad(1) = 0;
   J;
   grad = grad+ regGrad;

endfunction
