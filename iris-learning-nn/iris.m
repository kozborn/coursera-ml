
% load data
data = load("iris.numerized.data");
shuffledArray = data(randperm(size(data,1)),:);

X = shuffledArray(:, 1: end - 1);
y = shuffledArray(:, end);


labels_num = 3;
hidden_layer_size = 2;
lambda = 0;

% adding bias unit
a1 = [ones(size(X), 1), X];
theta1 = rand(hidden_layer_size, size(a1, 2))

z1 = a1*theta1';

a2 = [ones(size(z1, 1), 1), sigmoid(z1)];
theta2 = rand(labels_num, size(a2, 2));

z2 = a2 * theta2';
a3 = sigmoid(z2)


theta1WithoutBias = theta1(:,2:end);
theta2WithoutBias = theta2(:,2:end);
sum1 = sum(sum(theta1WithoutBias.^2));
sum2 = sum(sum(theta2WithoutBias.^2));


% z2 = a2 * theta2';
% a3 = sigmoid(z2);


