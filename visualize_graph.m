function visualize_graph(adj_matrix, colors)
    % Get the number of vertices from the size of the adjacency matrix
    num_vertices = size(adj_matrix, 1);

    % Get the coordinates of the vertices
    theta = 2 * pi * (1:num_vertices) / num_vertices;
    x = cos(theta);
    y = sin(theta);

    
    sz =400;
    % Plot the vertices with specified colors
    scatter(x, y, sz, colors, 'filled');
    hold on;

    % Plot the edges
    for i = 1:num_vertices
        for j = i + 1:num_vertices
            if adj_matrix(i, j) == 1
                plot([x(i) x(j)], [y(i) y(j)], 'black');
            end
        end
    end

    % Set the axis limits
    axis([-1.1 1.1 -1.1 1.1]);
    axis square;
    axis off;
end


