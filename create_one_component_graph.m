function adj_matrix = create_one_component_graph(N)
    adj_matrix = ones(N);
    for i =1:length(adj_matrix)
        adj_matrix(i, i)=0;
    end

end