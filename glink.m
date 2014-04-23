function [W_ML,W_CL] = glink(N,Label,Select)
W_ML = zeros(N,N); W_CL = zeros(N,N);
NN = N*(N-1)/2;
a = zeros(2,NN);
temp = 1;
ran = randperm(NN);
for i = 1:(N-1)
    for j = (i+1):N
        a(:,ran(temp)) = [i,j];
        temp = temp+1;
    end
end
for iter = 1:Select
    if Label(a(1,iter),1)==Label(a(2,iter),1)
       W_ML(Label(a(1,iter),2),Label(a(2,iter),2)) = 1;
       W_ML(Label(a(2,iter),2),Label(a(1,iter),2)) = 1;
    else
       W_CL(Label(a(1,iter),2),Label(a(2,iter),2)) = 1;
       W_CL(Label(a(2,iter),2),Label(a(1,iter),2)) = 1;
    end
end



