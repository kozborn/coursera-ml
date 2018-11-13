function g= sigmoid(x, t)
  % x and t are vectors of values
  % x = [1; 2; 3; 4]
  % t = [0.1; 0.2; 0.3; 0.4]
  g = 1./ (1 + exp(-(t'*x)))