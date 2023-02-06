nodes = [1 2 3; 4 5 6; 7 5 9]; % matrix of node coordinates
connections = [1 2; 1 3; 2 3]; % matrix of node connections

figure
scatter3(nodes(:,1), nodes(:,2), nodes(:,3), 100, 'filled') % plot nodes as points
hold on
for i = 1:size(connections,1)
    node1 = connections(i,1);
    node2 = connections(i,2);
    x = [nodes(node1,1) nodes(node2,1)]; % x coordinates of the two nodes
    y = [nodes(node1,2) nodes(node2,2)]; % y coordinates of the two nodes
    z = [nodes(node1,3) nodes(node2,3)]; % z coordinates of the two nodes
    plot3(x,y,z, '-k') % plot line between the two nodes
end
xlabel('X')
ylabel('Y')
zlabel('Z')
title('3D Network')
