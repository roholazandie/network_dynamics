function adj_matrix = create_two_components_graph(M, N)
    % Initialize the adjacency matrix with zeros
    adj_matrix = zeros(M + N);

    % Connect all vertices in the first component to each other
    for i = 1:M
        for j = i + 1:M
            adj_matrix(i, j) = 1;
            adj_matrix(j, i) = 1;
        end
    end

    % Connect all vertices in the second component to each other
    for i = M + 1:M + N
        for j = i + 1:M + N
            adj_matrix(i, j) = 1;
            adj_matrix(j, i) = 1;
        end
    end

    % Connect the first and second components via one vertex
    adj_matrix(1, M + 1) = 1;
    adj_matrix(M + 1, 1) = 1;
end