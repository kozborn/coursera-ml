
% load data
data = load("iris.numerized.data");
shuffledArray = data(randperm(size(data,1)),:);

X = shuffledArray(:, 1: end - 1);
y = shuffledArray(:, end);

irisSetosa = find(y==1);
irisVersicolor = find(y==2);
irisVirginica = find(y==3);

% display obtained data
figure; hold on;

% 1 and 3 are choosen by hand, it is easy to see irises on plot
plot(X(irisSetosa, 1), X(irisSetosa, 3), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(irisVersicolor, 1), X(irisVersicolor, 3), 'k*', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
plot(X(irisVirginica, 1), X(irisVirginica, 3), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);

hold off;

num_labels = 3;
input_layer_size = size(X, 2); % 4 for iris data
hidden_layer_size = 5;
lambda = 0;

y_matrix = eye(num_labels)(y,:);

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
                   num_labels, X, y, lambda);

fprintf('Cost with lambda = 0: %f ', J);

lambda = 1;

J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);
fprintf('Cost with lambda = 1: %f ', J);


% fprintf('\nChecking Backpropagation... \n');
%  Check gradients by running checkNNGradients
% checkNNGradients;

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 50);
% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
initial_nn_params = [theta1(:); theta2(:)];
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));


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

pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);


