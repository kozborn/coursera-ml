function g = matrixSigmoid(x, theta)
  % x is a vectors of values
  % x = [1; 2; 3; 4]
  % theta is matrix MxN
  % theta = [
  %   0.1, 0.2, 0.3, 0.4;
  %   0.1, 0.2, 0.3, 0.4;
  %   0.1, 0.2, 0.3, 0.4;
  %   ....
  %   0.1, 0.2, 0.3, 0.4
  % ]
  g = 1./ (1 + exp(-(theta*x)));
  