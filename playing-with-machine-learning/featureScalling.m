function [X,tmpR, tmpMe] = featureScalling(X)
  [m, n] = size(X);
  r = [];
  me = [];
  for i=2:n
    tmpR = range(X(:,i));
    r = [r tmpR];
    tmpMe = mean(X(:,i));
    me = [me tmpMe];
    X(:, i) = (X(:,i) - tmpMe) / tmpR;
  endfor
  X;
  tmpR;
  tmpMe;
endfunction
