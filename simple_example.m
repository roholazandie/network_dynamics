clc;
clear;


% A = [0 1 1 1 0 0 0 0;
%      1 0 1 1 0 0 0 0;
%      1 1 0 1 0 0 0 0;
%      1 1 1 0 1 0 0 0;
%      0 0 0 1 0 1 1 1;
%      0 0 0 0 1 0 1 1;
%      0 0 0 0 1 1 0 1;
%      0 0 0 0 1 1 1 0];


% a grid of 9 nodes (3x3)
A = [0 1 0 1 0 0 0 0 0;
     1 0 1 0 1 0 0 0 0;
     0 1 0 0 0 1 0 0 0;
     1 0 0 0 1 0 1 0 0;
     0 1 0 1 0 1 0 1 0;
     0 0 1 0 1 0 0 0 1;
     0 0 0 1 0 0 0 1 0;
     0 0 0 0 1 0 1 0 1;
     0 0 0 0 0 1 0 1 0];

% fully connected graph of 9 nodes
% A = create_one_component_graph(9);


D = diag(sum(A, 1));
L = D - A;

eig(L)

% x = [5, 5, 5, 10, 5, 5, 5, 5]';

x = [20, 20, 20, 20, 1, 1, 1, 1, 1]';

imagesc(x./norm(x));
k = 0.8;
dt = 0.1;
for i=1:10000
    x = x + -k*dt*L*x;
    imagesc(reshape(x, 3, 3));
    axis equal off;
    drawnow;

end









