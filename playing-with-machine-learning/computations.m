function computations(X, Y)
  
  % preparing data for calculation
  % results are taken from day 2 to end so previous day will define next day closing price
  lambda = 0.5;
  [m, n] = size(X);

  % setting up test set count to 20%
  testSetCount = ceil((20/100) * m);

  % setting up crossvalidation set count to 20%
  cvSetCount = ceil((20/100) * m);


  % getting subsets for training and tests
  trainingSet = X(1: end - testSetCount - cvSetCount, :);
  trainingResults = Y(1: end - testSetCount - cvSetCount, :);
  % Cross Validation set
  cvSet = X(end - testSetCount - cvSetCount: end, :);
  cvResults = Y(end - testSetCount - cvSetCount: end, :);
  % Test set
  testSet = X(end - cvSetCount: end, :);
  testResults = Y(end - cvSetCount: end, :);

  initial_theta = zeros(size(X,2), 1);
  J = costFunction(trainingSet, trainingResults, initial_theta, lambda);
  fprintf("Training set\n")
  fprintf("[Training set] Cost with initial theta: %f \n", J);

  %  Set options for fminunc
  options = optimset('GradObj', 'on', 'MaxIter', 500);
  %  Run fminunc to obtain the optimal theta
  %  This function will return theta and the cost 
  [theta, cost] = ...
    fminunc(@(t)(costFunction(trainingSet, trainingResults, t, lambda, i)), initial_theta, options);
  fprintf("[Training set] Cost with optimal theta: %f \n", cost);

  fprintf("CrossValidation set (%d) \n", cvSetCount)
  J = costFunction(cvSet, cvResults, theta, lambda, i);
  fprintf("[Cross Validation set] Cost with optimal theta: %f \n \n", J);

  % fprintf("Test set (%d) \n", testSetCount)
  % J = costFunction(testSet, testResults, theta);
  % fprintf("[Test set] Cost with optimal theta: %f \n", J);