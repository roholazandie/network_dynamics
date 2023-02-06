clc;
clear;

dt = 0.1;
N = 200;
T = 30000;
ds(N, N, 3) = 0;
prev_idx = mod((1:N)-2, N)+1;
post_idx = mod(1:N, N)+1;

D = 1;
mu = 1;
sigma = 1;

f = rand(N, N, 3);
s0 = ones(N, N);
% resembles solve differential equation x'=x''+2x(100-x)
for t = 1:T
    rho = sum(f, 3);
    for n=1:3
        reaction = f(:,:,n).*(mu*(s0-rho) - sigma * f(:, : ,mod(n, 3)+1));
        % the laplacian for L(i,j) = f(i+1, j) + f(i-1, j) + f(i, j+1) + f(i, j-1) - 4f(i,j)
        diffusion = D * (f(prev_idx, :, n) + f(post_idx, :, n) + f(:, prev_idx, n) + f(:, post_idx, n) -4*f(:,:,n));
        
%         %alternative way using the matlab laplacian operator
%         h = fspecial('laplacian',0);
%         diffusion = D* imfilter(f(:,:, n), h, 'circular');

        ds(:,:, n) = diffusion + reaction;
    end
    f = f + dt*ds;

    if mod(t, 10) == 0
        [~, state] = max(f, [], 3);
        imagesc(state);
        axis equal off;
        drawnow;
    end
end