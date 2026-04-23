function x = ComputeBestRoot5(handle_f,x1,x2,x3,x4,x5)
% x_i = arg min_{t \in {x1(i),x2(i),x3(i),x4(i),x5(i)} }  f(t)
% with i = 1,..., n
% handle_f: R => R
% x1: n x 1
% x2: n x 1
% x3: n x 1
% x4: n x 1
% x5: n x 1

dim = length(x1);
num = 5;
X = [x1 x2 x3 x4 x5]';
f1 = handle_f(x1); 
f2 = handle_f(x2); 
f3 = handle_f(x3);
f4 = handle_f(x4);
f5 = handle_f(x5);
F = [f1 f2 f3 f4 f5];
[~,I]=min(F,[],2);
x = X(I + [1:num:dim*num]'-1);
x = reshape(x,dim,1);