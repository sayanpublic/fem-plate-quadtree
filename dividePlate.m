function tree_structure = dividePlate(x_min, x_max, y_min, y_max, divisions, tree_structure, level, child_index)
    % Base case: If no more divisions are needed, return
    if divisions == 0
        return;
    end
    
    % Calculate midpoints
    x_mid = (x_min + x_max) / 2;
    y_mid = (y_min + y_max) / 2;
    
    % Recursively divide each part
    % Update child index for the next level
    child_index = (child_index - 1) * 4;
    tree_structure = dividePlate(x_min, x_mid, y_mid, y_max, divisions - 1, tree_structure, level + 1, child_index + 1);
    tree_structure = dividePlate(x_mid, x_max, y_mid, y_max, divisions - 1, tree_structure, level + 1, child_index + 2);
    tree_structure = dividePlate(x_min, x_mid, y_min, y_mid, divisions - 1, tree_structure, level + 1, child_index + 3);
    tree_structure = dividePlate(x_mid, x_max, y_min, y_mid, divisions - 1, tree_structure, level + 1, child_index + 4);
    
    % Store the calculated x_min, x_max, y_min, and y_max values for the child
    tree_structure(level).child_cell(child_index + 1).x_min = x_min;
    tree_structure(level).child_cell(child_index + 1).x_max = x_mid;
    tree_structure(level).child_cell(child_index + 1).y_min = y_mid;
    tree_structure(level).child_cell(child_index + 1).y_max = y_max;
    
    tree_structure(level).child_cell(child_index + 2).x_min = x_mid;
    tree_structure(level).child_cell(child_index + 2).x_max = x_max;
    tree_structure(level).child_cell(child_index + 2).y_min = y_mid;
    tree_structure(level).child_cell(child_index + 2).y_max = y_max;
    
    tree_structure(level).child_cell(child_index + 3).x_min = x_min;
    tree_structure(level).child_cell(child_index + 3).x_max = x_mid;
    tree_structure(level).child_cell(child_index + 3).y_min = y_min;
    tree_structure(level).child_cell(child_index + 3).y_max = y_mid;
    
    tree_structure(level).child_cell(child_index + 4).x_min = x_mid;
    tree_structure(level).child_cell(child_index + 4).x_max = x_max;
    tree_structure(level).child_cell(child_index + 4).y_min = y_min;
    tree_structure(level).child_cell(child_index + 4).y_max = y_mid;
end
