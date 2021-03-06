
% load data
data = load("iris.numerized.data");
shuffledArray = data(randperm(size(data,1)),:);
X = shuffledArray(:, 1: end - 1);
y = shuffledArray(:, end);

calculations(X, y);