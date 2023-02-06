clc;
clear;

% this script implements the Newton's law of cooling on a graph
% asynchornously
%\frac{d \phi_i}{d t}=-k \sum_j A_{i j}\left(\phi_i-\phi_j\right)


T =1000; %number of iterations
dt = 0.1; % the time step 

m = 10; % size of the first connected component
n = 7; % size of the second connected component
A = create_two_components_graph(m, n);

phi = [randi([1000 2000], 1, m) randi([0 400], 1, n)]';
N = length(A); % number of nodes

equilibrium_temperature = mean(phi);

k = 1; % thermal conductivity


for t=1:T
    
    for i=1:N
        for j=1:N
            phi(i) = phi(i) - dt* k* A(i, j) * (phi(i) - phi(j));
        end
    end


    if mod(t, 10) == 0
        visualize_graph(A, phi./norm(phi));
        axis equal off;
        drawnow;
    end

     
end

