clc;
clear;

T =300;
dt = 0.01;

n = 10;
A = create_one_component_graph(n);

phi = [randi([0 1000], 1, n)]';
N = length(A);

D = diag(sum(A, 1));
L = D - A;

eig(L)

for t=1:T
    diff1 = -L*phi;
    phi = phi + dt * diff1;
     if mod(t, 1) == 0
        visualize_graph(A, phi./norm(phi));
        axis equal off;
        drawnow;
        pause(1);
     end
end

