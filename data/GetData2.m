function [A,B] = GetData(iwhich)
rand('seed',0);
randn('seed',0);
switch iwhich
    case 1
        m = 500;
        n = 1000;
        A = GetTDT2(m,n); % sparse
    case 2
        m = 500;
        n = 1000;
        A = Get20Newsgroups(m,n);  % sparse
    case 3
%         m = 6412;
        m = 500;
        n = 1000;
        A = GetSector(m,n);  % sparse
    case 4
        m = 500;
        n = 1000;
        A = randn(m,n)*1e-3;  % sparse
end




X = full(A);
y = randn(size(X,1),1);
y = sign(y);
classes = unique(y);
c = length(classes);
[m, d] = size(X);
mu = mean(X);

% 
B = zeros(d, d);
A = zeros(d, d);

for i = 1:c
    Xi = X(y == classes(i), :);
    ni = size(Xi, 1);
    mu_i = mean(Xi);
    
    % within-class covariance
    Xi_centered = Xi - mu_i;
    B = B + Xi_centered' * Xi_centered;
    
    % between-class covariance
    mu_diff = (mu_i - mu)';
    A = A + ni * (mu_diff * mu_diff');
end

%  S_W 
epsilon = 1e-6;
B = B + epsilon * eye(d);

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







