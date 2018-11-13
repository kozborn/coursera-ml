function neural() 
  % fprintf("Testing AND \n")
  % x = [0; 0];
  % a1 = [1; x];
  % t1 = [-30, 20, 20];
  % matrixSigmoid([1; x], t1)

  % x = [0; 1];
  % matrixSigmoid([1; x], t1)

  % x = [1; 0];
  % matrixSigmoid([1; x], t1)

  % x = [1; 1];
  % matrixSigmoid([1; x], t1)

  % fprintf("Testing OR \n")
  % x = [0; 0];
  % t1 = [-10, 20, 20];
  % matrixSigmoid([1; x], t1)

  % x = [0; 1];
  % matrixSigmoid([1; x], t1)

  % x = [1; 0];
  % matrixSigmoid([1; x], t1)

  % x = [1; 1];
  % matrixSigmoid([1; x], t1)

  fprintf("Testing XNOR \n")
  x = [0; 0];
  t1 = [
    -30, 20, 20; 
    10, -20, -20;
  ];

  t2 = [-10, 20, 20];
  a2 = matrixSigmoid([1; x], t1);
  g = matrixSigmoid([1; a2], t2);
  fprintf("0 XNOR 0 = %f \n", g)

  x = [0; 1];
  a2 = matrixSigmoid([1; x], t1);
  g = matrixSigmoid([1; a2], t2);
  fprintf("0 XNOR 1 = %f \n", g)

  x = [1; 0];
  a2 = matrixSigmoid([1; x], t1);
  g = matrixSigmoid([1; a2], t2);
  fprintf("1 XNOR 0 = %f \n", g)

  x = [1; 1];
  a2 = matrixSigmoid([1; x], t1);
  g = matrixSigmoid([1; a2], t2);
  fprintf("1 XNOR 1 = %f \n", g)


  % t1 = rand(3, length(a1))



  % a2 = [1; matrixSigmoid(a1, t1)]

  % outputTheta = rand(length(a2), 1)
  % output = sigmoid(a2, outputTheta)


  