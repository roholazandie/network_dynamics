clc;
clear;

T =1000;
dt = 0.1;


% the adjacency matrix for a grid
% A = [0 1 0 1 0 0 0 0 0;
%      1 0 1 0 1 0 0 0 0;
%      0 1 0 0 0 1 0 0 0;
%      1 0 0 0 1 0 1 0 0;
%      0 1 0 1 0 1 0 1 0;
%      0 0 1 0 1 0 0 0 1;
%      0 0 0 1 0 0 0 1 0;
%      0 0 0 0 1 0 1 0 1;
%      0 0 0 0 0 1 0 1 0];

m = 10;
n = 7;
A = create_two_components_graph(m, n);

phi = [randi([1000 2000], 1, m) randi([0 400], 1, n)]';
N = length(A);

equilibrium_temperature = mean(phi);

k = 0.1; % thermal conductivity

new_phi = phi;

for t=1:T
    
    
    for i=1:N
        for j=1:N
            new_phi(i) = new_phi(i) - k* A(i, j) * (phi(i) - phi(j));
        end
    end

    phi = new_phi;
     if mod(t, 10) == 0
        visualize_graph(A, phi./norm(phi));
        axis equal off;
        drawnow;
     end

     
end

