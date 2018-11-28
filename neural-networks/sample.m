
% load data
data = load("prd.csv");
shuffledArray = data(randperm(size(data,1)),:);
shuffledArray = data;
X = shuffledArray(:, 1: end - 1);
X = [X X(:,1) - X(:,4)];
y = shuffledArray(:, end);

calculations(X, y);