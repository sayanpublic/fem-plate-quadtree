clear all
close all
clc


Node_list = importdata('Node_list.dat');
Patch_list = importdata('Patch_list.dat');



 % Create 2D Matrix: Structure within a structure
max_level = 4;
min_x = 0;
max_x = 100;
min_y = 0;
max_y = 100;
tree_structure = struct('cell_count', {}, 'child_cell', struct('x_min', [], 'x_max', [], 'y_min', [], 'y_max', [], 'index', []));

for i = 1:max_level
    no_of_children = 4^(i - 1);
    tree_structure(i).cell_count = no_of_children;
    tree_structure(i).child_cell.x_min = min_x;
    tree_structure(i).child_cell.x_max = max_x;
    tree_structure(i).child_cell.y_min = min_y;
    tree_structure(i).child_cell.y_max = max_y;
end
   tree_structure = dividePlate(0, 100, 0, 100, max_level-1, tree_structure, 2,1);
% 
% % Call the function to populate centroid indices
%tree_structure = populateCentroidIndices(Patch_list,Node_list, tree_structure);