clc;
clear;
 
% L = [-4, 1, 1, 1; 1, -1, 0, 0; 1, 0, -1, 0; 1, 0, 0, -1];
% 
% x = [5, 1, 0, 2]';
% x./norm(x)
% for i=1:10
%     x = x./norm(x);
%     new_x = -L*x;
%     new_x
%     x = new_x;
% end


% A = [0 1 1 1 0 0 0 0;
%      1 0 1 1 0 0 0 0;
%      1 1 0 1 0 0 0 0;
%      1 1 1 0 1 0 0 0;
%      0 0 0 1 0 1 1 1;
%      0 0 0 0 1 0 1 1;
%      0 0 0 0 1 1 0 1;
%      0 0 0 0 1 1 1 0];
% 
% D = diag(sum(A, 1));
% L = D - A;
% 
% 
% x = [5, 5, 5, 10, 5, 1, 1, 1]';
% 
% imagesc(x./norm(x));
% 
% for i=1:100
%     x = x./norm(x);
%     new_x = -L*x;
%     new_x
%     x = new_x;
%     imagesc(x./norm(x));
%     axis equal off;
%     drawnow;
%     pause(0.2)
% 
% end


A = [0 1 1 1 0 0 0 0;
     1 0 1 1 0 0 0 0;
     1 1 0 1 0 0 0 0;
     1 1 1 0 1 0 0 0;
     0 0 0 1 0 1 1 1;
     0 0 0 0 1 0 1 1;
     0 0 0 0 1 1 0 1;
     0 0 0 0 1 1 1 0];


D = diag(sum(A, 1));
L = D - A;


x = [5, 5, 5, 10, 5, 5, 5, 5]';

imagesc(x./norm(x));
k = 0.1;
dt = 0.1;
for i=1:100000
    %x = x./norm(x);
    x = x + -k*dt*L*x;
    imagesc(x./norm(x));
    axis equal off;
    drawnow;

end









