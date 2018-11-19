function [J, Jcv, JTest, theta] = computations(X, Y, lambda)
  
  % preparing data for calculation
  % results are taken from day 2 to end so previous day will define next day closing price
  [m, n] = size(X);

  % setting up test set count to 10%
  testSetCount = ceil((10/100) * m);

  % setting up crossvalidation set count to 20%
  cvSetCount = ceil((10/100) * m);

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
  
  % [J, grad] = costFunction(trainingSet, trainingResults, initial_theta, lambda);
  % fprintf("Training set\n")
  % fprintf("[Training set] Cost with initial theta: %f \n", J);

  %  Set options for fminunc
  options = optimset('GradObj', 'on', 'MaxIter', 1500);
  %  Run fminunc to obtain the optimal theta
  %  This function will return theta and the cost 
  warning("off");
  [theta, cost] = ...
    fminunc(@(t)(costFunction(trainingSet, trainingResults, t, lambda)), initial_theta, options);
  warning("on");
  fprintf("\nTraining set\n")
  [J, grad] = costFunction(trainingSet, trainingResults, theta, lambda);
  fprintf("[Training set] Cost with optimal theta: %f \n", cost);

  fprintf("CrossValidation set (%d) \n", cvSetCount)
  [Jcv, grad] = costFunction(cvSet, cvResults, theta, lambda);
  fprintf("[Cross Validation set] Cost with optimal theta: %f \n", Jcv);

  fprintf("Test set (%d) \n", testSetCount)
  [JTest, grad] = costFunction(testSet, testResults, theta, lambda);
  fprintf("[Test set] Cost with optimal theta: %f \n", JTest);
  
  J;
  Jcv;
  JTest;
  theta;