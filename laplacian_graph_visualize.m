clc;
clear;

N = 10;
A = zeros(N, N);

video = VideoWriter('laplacian.avi', 'Motion JPEG AVI');
video.Quality = 100;
video.FrameRate = 30;
open(video);



for i=1:N
    for j=i+1:N
        A(i, j) = 1;
        A(j, i) = 1;
        
        subplot(2, 1, 1);
        visualize_graph(A, zeros(1, N));
        subplot(2, 1, 2);
        D = diag(sum(A, 1));
        L = D - A;
        scatter(1:N, eig(L)')
        axis([0 N 0 N]);
        title('Eigenvalues of Laplacian')
        drawnow;
        pause(1);

        frame = getframe(gcf);
        writeVideo(video, frame);
    end
end

close(video);