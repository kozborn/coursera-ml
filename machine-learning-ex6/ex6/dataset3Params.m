function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% params_vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';

% predictions_err = zeros(length(params_vec), zeros(length(params_vec)));

% for i = 1:length(params_vec)
%   tmpC = params_vec(i);
%   for j = 1:length(params_vec)
%     tmpSigma = params_vec(j);
%     model = svmTrain(X, y, tmpC, @(x1, x2) gaussianKernel(x1, x2, tmpSigma));
%     predictions = svmPredict(model, Xval);
%     predictions_err(i,j) = mean(double(predictions ~= yval));
%   endfor
% endfor

% predictions_err;

% minVal = min(min(predictions_err));
% [row, col] = find(predictions_err == minVal);

% C = params_vec(row)
% sigma = params_vec(col)
C = 1
sigma = 0.1

% =========================================================================

end
