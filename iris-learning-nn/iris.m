
% load data
data = load("iris.numerized.data");
shuffledArray = data(randperm(size(data,1)),:);

X = shuffledArray(:, 1: end - 1);
y = shuffledArray(:, end);


labels_num = 3;
hidden_layer_size = 5;
lambda = 0;

% adding bias unit
a1 = [ones(size(X), 1), X]
theta1 = rand(size(a1, 2), hidden_layer_size)


