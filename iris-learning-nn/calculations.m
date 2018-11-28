function calculations(X, y) 
  [m, n] = size(X);
  % setting up test set count to 10%
  testSetCount = ceil((10/100) * m);

  % setting up crossvalidation set count to 10%
  cvSetCount = ceil((10/100) * m);

  % getting subsets for training and tests
  trainingSet = X(1: end - testSetCount - cvSetCount, :);
  trainingResults = y(1: end - testSetCount - cvSetCount, :);
  % Cross Validation set
  cvSet = X(end - testSetCount - cvSetCount: end, :);
  cvResults = y(end - testSetCount - cvSetCount: end, :);
  % Test set
  testSet = X(end - cvSetCount: end, :);
  testResults = y(end - cvSetCount: end, :);

  irisSetosa = find(trainingResults==1);
  irisVersicolor = find(trainingResults==2);
  irisVirginica = find(trainingResults==3);

  % display obtained data
  figure; hold on;

  % 1 and 3 are choosen by hand, it is easy to see irises on plot
  plot(trainingSet(irisSetosa, 1), trainingSet(irisSetosa, 3), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
  plot(trainingSet(irisVersicolor, 1), trainingSet(irisVersicolor, 3), 'k*', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  plot(trainingSet(irisVirginica, 1), trainingSet(irisVirginica, 3), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);

  hold off;

  num_labels = 3;
  input_layer_size = size(trainingSet, 2); % 4 for iris data
  hidden_layer_size = 5;
  lambda = 0;

  y_matrix = eye(num_labels)(trainingResults,:);

  %   Randomly initialize the weights of a layer with L_in
  %   incoming connections and L_out outgoing connections
  %   W = L_in, L_out) randomly initializes the weights 
  %   of a layer with L_in incoming connections and L_out outgoing 
  %   connections. 
  %
  %   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
  %   the first column of W handles the "bias" terms

  epsilon = 0.12;
  theta1 = rand(hidden_layer_size, input_layer_size + 1) * 2 * epsilon - epsilon;
  theta2 = rand(num_labels, hidden_layer_size + 1) * 2 * epsilon - epsilon;

  nn_params = [theta1(:); theta2(:)];

  J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                    num_labels, trainingSet, trainingResults, lambda);

  fprintf('Cost with lambda = 0: %f ', J);

  % fprintf('\nChecking Backpropagation... \n');
  %  Check gradients by running checkNNGradients
  % checkNNGradients;

  fprintf('\nTraining Neural Network... \n')

  %  After you have completed the assignment, change the MaxIter to a larger
  %  value to see how more training helps.
  iterationsLength = 100;
  options = optimset('MaxIter', iterationsLength);

  % Create "short hand" for the cost function to be minimized
  costFunction = @(p) nnCostFunction(p, ...
                                    input_layer_size, ...
                                    hidden_layer_size, ...
                                    num_labels, trainingSet, trainingResults, lambda);

  % Now, costFunction is a function that takes in only one argument (the
  % neural network parameters)
  initial_nn_params = [theta1(:); theta2(:)];
  [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

  % Obtain Theta1 and Theta2 back from nn_params
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                  hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                  num_labels, (hidden_layer_size + 1));


  % visualize cost function

  xaxis = [1: iterationsLength];
  figure; hold on;
  plot(xaxis, cost);
  xlabel('iterations');
  ylabel('J value');
  hold off;

  %% ================= Visualize Weights =================
  %  You can now "visualize" what the neural network is learning by 
  %  displaying the hidden units to see what features they are capturing in 
  %  the data.

  % fprintf('\nVisualizing Neural Network... \n')

  % displayData(Theta1(:, 2:end));

  % fprintf('\nProgram paused. Press enter to continue.\n');

  %  ================= Predict =================
  %  After training the neural network, we would like to use it to predict
  %  the labels. You will now implement the "predict" function to use the
  %  neural network to predict the labels of the training set. This lets
  %  you compute the training set accuracy.

  trainingPred = predict(Theta1, Theta2, trainingSet);
  fprintf('\nTraining Set Accuracy: %f\n', mean(double(trainingPred == trainingResults)) * 100);

  cvPred = predict(Theta1, Theta2, cvSet);
  fprintf('\nCV Set Accuracy: %f\n', mean(double(cvPred == cvResults)) * 100);

  testPred = predict(Theta1, Theta2, testSet);
  fprintf('\nTest Set Accuracy: %f\n', mean(double(testPred == testResults)) * 100);
  % Calculating cost J depending on lambda value

  lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';
  Js = zeros(length(lambda_vec), 1);

  for i=1:length(lambda_vec)
    lambda = lambda_vec(i);
    costFunction = @(p) nnCostFunction(p, ...
                                      input_layer_size, ...
                                      hidden_layer_size, ...
                                      num_labels, trainingSet, trainingResults, lambda);
    initial_nn_params = [theta1(:); theta2(:)];
    [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
    Js(i) = min(cost);
  end

  figure; hold on;
  plot(lambda_vec, Js);
  xlabel('lambda value');
  ylabel('J value');
  hold off;
