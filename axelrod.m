clc;
clear;

N = 500;
T = 1000000;

n_features = 10;
n_traits = 15;
s = randi([1 n_traits], N, n_features);

for t=1:T
    if mod(t, 100) == 1
        imagesc(s');
        axis off;
        drawnow;
    end
    r_person = randi([1 N], N, 1);
    direction = 2*randi([0 1], N, 1) - 1;
    step = randi([1 2], N, 1);
    r_neighbor = mod(r_person-1+step.*direction, N)+1;
    r_feature = randi([1 n_features], N, 1);

    for n=1:N
        if s(r_person(n,1), r_feature(n, 1)) == s(r_neighbor(n, 1), r_feature(n, 1))
            difference = find(s(r_person(n, 1), :) ~= s(r_neighbor(n, 1), :));
            if size(difference, 2)>0
                transfer = difference(randperm(size(difference, 2), 1));
                s(r_person(n,1), transfer) = s(r_neighbor(n, 1), transfer);
            end
        end
    end

end