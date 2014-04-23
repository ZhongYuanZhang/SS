%  

clear
close all

A = eye(22,22);
A(1,2:4) = 1; 
A(2,1) = 1; A(2,3:5) = 1;
A(3,[1 2 4 5 6 7]) = 1;
A(4,[1 2 3 7 8 11]) = 1;
A(5,[2 3 6]) = 1;
A(6,[3 5 8]) = 1;
A(7,[3 4 8]) = 1;
A(8,[4 6 7 14 16]) = 1;
A(9,[10 11 12]) = 1;
A(10,[9 13]) = 1;
A(11,[4 9 12 14]) = 1;
A(12,[9 11 13 14 15]) = 1;
A(13,[10 12 15]) = 1;
A(14,[8 11 12 15 17]) = 1;
A(15,[12 13 14]) = 1;
A(16,[8 17 18 19]) = 1;
A(17,[14 16 19 20]) = 1;
A(18,[16 19 21]) = 1;
A(19,[16 17 18 20 21 22]) = 1;
A(20,[17 19 22]) = 1;
A(21,[18 19 22]) = 1;
A(22,[19 20 21]) = 1;

N = length(A);  NN = N*(N-1)/2;

classLabel = zeros(N,2);
classLabel(:,2) = [1:N]';
classLabel(:,1) = [1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 3 3 3 3 3 3 3];
percent = 0.1;
ppnum = round(NN*percent);
[ml,cl] = glink(N,classLabel,ppnum);
                                    % ¢Ù  ml and cl
[dml,dcl] = pcd(ml,cl);             % ¢Ú Information enhancement  

alpha = 1;
[B1] = sscmd(A,ml,cl,alpha);  
[B2] = sscmd(A,dml,dcl,alpha);  

imagesc(A);figure(gcf);
figure; imagesc(B1);figure(gcf);
figure; imagesc(B2);figure(gcf);







