function [b] = sscmd(a,ml,cl,r)
% Semi-supervised community structure detection.
% This function is used to get a new matrix from adjacency matrix based on
% some pairs constraints. 

% Input  :
% a(n*n) : The adjacency matrix of a network with n nodes.
%          a(i,j) = 1, if i ~ j
%          a(i,j) = 0, if i = j or i !~ j
%          Note that here a is n*n and symmetric.
% ml(2*a): Must-link constraints,every column of ml means a constraint.
% cl(2*b): Cannot-link constraints,every column of cl means a constraint.
% r      : some positive constant,setted to be 1 when default.
%          b(i,j)=r, if(i,j)¡ÊML

% Output :
% b(n*n) : new matrix getted from the adjacency matrix a.
%           b(i,j) = r,      if(i,j)¡ÊML;
%           b(i,j) = 0,      if(i,j)¡ÊCL;
%           b(i,j) = a(i,j), otherwise.

% Set the default value of r.
if nargin < 4
    r = 1;
end

if length(a(:,1)) ~= length(a(1,:))
    error('matrix entries must be an square matrix');
    return
end

n = length(a);
b = a;

% Change the b based on the rules we set above.
for i = 1:(n-1)
    for j = (i+1):n
        if ml(i,j) == 1
            b(i,j) = r;
            b(j,i) = r;
        elseif cl(i,j) == 1
            b(i,j) = 0;
            b(j,i) = 0;
        end
    end
end