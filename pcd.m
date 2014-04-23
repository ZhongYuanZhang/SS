function [ML,CL] = pcd(ml,cl)
% This function is used to get more constraints information from some given constraints
% The function mark 'pcd' means "pairwise constraints' derivation".
% In the function,we first put the given constraints in a symmetrical
% matrix l based on the following rule:
%          l(i,j)=1, if (i,j)（ML;(Note that l(i,j)=1 when i=j)
%          l(i,j)=2, if (i,j)（CL;
%          l(i,j)=0, otherwise
% Then we use some for loops to get more constraints which we storage in
% matrix ML and CL respectively at last.

% Input   :
% ml(n*n) : We default the constraints given are in two symmetric matrix
%           ml and cl.The elements either in ml or cl have only two values
%           0 and 1.
%           For matrix ml:
%           ml(i,j) = 1, if (i,j)（ML;
%           ml(i,j) = 0, otherwise
% cl(n*n) : Similar with ml,for matrix cl:
%           cl(i,j) = 1, if (i,j)（CL 
%           cl(i,j) = 0, otherwise


% Here we change the given constraints matrix ml and cl to 2*colunm style.
n = length(ml);
[row1,col1] = find(ml==1);
[row2,col2] = find(cl==1); % Find all the node pairs belong to ML or CL.
%----------------------------------------------------------------------
ml = [row1,col1]';
cl = [row2,col2]';         % Change the style of ml and cl.
%----------------------------------------------------------------------

% Put the given information in matrix l.
l = eye(n); % Initalize l, set the diagonal elements to be 1.
a = length(ml);
b = length(cl);
for i = 1:a
    l(ml(1,i),ml(2,i)) = 1;
    l(ml(2,i),ml(1,i)) = 1;
end
for i = 1:b
    l(cl(1,i),cl(2,i)) = 2;
    l(cl(2,i),cl(1,i)) = 2;
end                                

% Get more constraints by the loop below. Code 48~60 is the most important 
% progress in this function. 
for i = 1:n
    for j = 1:n
        for r = (j+1):n
            if l(i,j) == 1 && l(i,r) == 1
                l(j,r) = 1;
                l(r,j) = 1;
            elseif (l(i,j) ==1 && l(i,r) == 2)||(l(i,j) == 2 && l(i,r) == 1)
                l(j,r) = 2;
                l(r,j) = 2;
            end
        end
    end
end

for j = 1:n
    l(j,j) = 0;
end
% Storage the output in matrix ML and CL respectively.
ML = (l==1);
CL = (l==2);
end