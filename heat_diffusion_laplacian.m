clc;
clear;

T =60;
dt = 0.1;
N = 3;
prev_idx = mod((1:N)-2, N)+1;
post_idx = mod(1:N, N)+1;
phi = [1, 1, 2; 5 10 0; 1 2 1];


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
% A = create_two_components_graph(m, n);

A = create_one_component_graph(n+m);

phi = [randi([1000 2000], 1, m) randi([0 400], 1, n)]';
N = length(A);

D = diag(sum(A, 1));
L = D - A;

eig(L)

video = VideoWriter('animation.avi', 'Motion JPEG AVI');
video.Quality = 100;
video.FrameRate = 30;
open(video);



for t=1:T
%     diff1 = zeros(N, N);
%     for i=1:N
%         for j=1:N
%             if i>1
%                 up = f(i-1, j);
%             else
%                 up =  f(i,j);%f(N, j);
%             end
%             
%             if j>1
%                 left = f(i, j-1);
%             else
%                 left =  f(i,j);%f(i, N);
%             end
% 
%             if i < N
%                 down = f(i+1, j);
%             else
%                 down =  f(i,j);%f(1, j);
%             end
% 
%             if j < N
%                 right = f(i, j+1);
%             else
%                 right =  f(i,j);%f(i, 1);
%             end
% 
%             diff1(i, j) = up + left + down + right - 4* f(i,j);
% 
%         end
%     end

%     diff1 = f(prev_idx, :) + f(post_idx, :) + f(:, prev_idx) + f(:, post_idx) -4*f(:,:);
    
%    diff1 = reshape(-L*f(:), N, N);

   diff1 = -L*phi;
    

    phi = phi + dt * diff1;
     if mod(t, 1) == 0
%         imagesc(f);
        visualize_graph(A, phi./norm(phi));
        axis equal off;
        drawnow;
        pause(0.2);
        frame = getframe(gcf);
        writeVideo(video, frame);
     end

     

end

close(video);
