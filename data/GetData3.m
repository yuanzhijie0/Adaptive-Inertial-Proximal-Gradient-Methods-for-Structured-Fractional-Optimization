function [A,B] = GetData3(iwhich,sigma)
rand('seed',0);
randn('seed',0);
switch iwhich
    case 1
        m = 9000;
        n = 3000;
        A = GetTDT2(m,n); % sparse
    case 2
        m = 10000;
        n = 3000;
        A = Get20Newsgroups(m,n);  % sparse
    case 3
%         m = 6412;
        m = 6412;
        n = 3000;
        A = GetSector(m,n);  % sparse
    case 4
        m = 10000;
        n = 3000;
        A = randn(m,n)*1e-3;  % sparse
end




X = full(A);


X2 = sum(X.^2, 2);                          % n x 1
dist2 = X2 + X2' - 2 * (X * X');            % n x n

W = exp(-dist2 / (2 * sigma^2));
size(W)
W = W - diag(diag(W));                      

A = diag(sum(W, 2));

B = A - W;




function A = GetRealData_TXT1(m,n)
load TEXT1.mat;
A = X;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = full(A);
A = A / norm(A(:),2);




function A = GetTDT2(m,n)
load TDT2
A = fea;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
A = A / norm(A(:),2);

function A = GetSector(m,n)
load sector_train;
A = x;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
A = A / norm(A(:),2);



function x = generate_x(n,k)
p = randperm(n);
x = zeros(n,1);
x(p(1:k)) = randn(k,1)*10;

function A = GetGisette(m,n)
load gisette;
A = x;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
A = A / norm(A(:),2);

function A = GetCifar(m,n)
load cifar;
A = data;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
% [A] = center(A);
% [m,n] = size(A);
% for i=1:data_n
% A(:,i) = A(:,i) / norm(A(:,i),2);
% end
A = A / norm(A(:),2);

function A = GetCnn_4096d_Caltech(m,n)
load cnn_4096d_Caltech_256;
A = double(feat);
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
A = A / norm(A(:),2);

function A = Get20Newsgroups(m,n)
load 20Newsgroups;
A = fea;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
A = A / norm(A(:),2);

function A = GetDataMnist_uint8(m,n)
load mnist;
A = x;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
A = A / norm(A(:),2);


function A = TXT(m,n)
load TEXT1;
A = X;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = double(A);
A = A / norm(A(:),2);

function A = GetRealData_w1a(m,n)
load w1a.mat;
A = x;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = full(A);
A = A / norm(A(:),2);

function A = GetRealDataE2006(m,n)
load E2006_5000_10000;
A = x;
[data_m,data_n] = size(A);
s1 = randperm(data_m,m);
s2 = randperm(data_n,n);
A = A(:,s2);
A = A(s1,:);
A = full(A);
A = A / norm(A(:),2);

function [A] = center(A)
[m,n] = size(A);
e = ones(m,1);
A = A - e*e'*A;







