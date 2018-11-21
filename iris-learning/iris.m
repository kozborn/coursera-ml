
% load data
data = load("iris.numerized.data");
shuffledArray = data(randperm(size(data,1)),:);

% randomize data
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

labels_num = 3;
lambda = 0;

thetas = oneVsAll(X, y, 3, lambda)

testX = [
  6.6,2.9,4.6,1.3; 
  6.3,2.5,4.9,1.5; 
  4.4,2.9,1.4,0.2;
  5.0,3.5,1.6,0.6;
  7.7,3.0,6.1,2.3;
  6.2,2.2,4.5,1.5
];

predictOneVsAll(thetas, testX)