function test()
  
  data = csvread('10cdr.csv');
  X = [ones(size(data, 1) -1, 1) data(1:end -1 , 1:end -1)]
  Y = data(2:end, end);
  [J Jcv JTest, theta] = computations(X, Y);
  
  X = [X X(:,2).^2 X(:,3).^3 X(:,4).^4 X(:,5).^5];
  [J Jcv JTest, theta] = computations(X, Y);
  
endfunction
