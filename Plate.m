classdef Plate
    properties
        max_x
        min_x
        max_y
        min_y
        centroid
        area
    end

    methods
        % constructor
        function obj = Plate(x_min,x_max,y_min,y_max)
            obj.x_min = x_min
            obj.x_max = x_max
            obj.y_min = y_min
            obj.Node4 = y_max
            obj.centroid = obj.calculate_centroid();
            obj.area = obj.calculate_Area();
        end

        % Calculate midpoint of diagonal
        function diagonalMidpoint= calculate_centroid(obj)
            diagonalMidpoint = 0.5 * (obj.Node1 + obj.Node3);

        end
         % Calculate area of the box
        function area_2D = calculate_Area(obj)
            side1 = norm(obj.Node1 - obj.Node2);
            side2 = norm(obj.Node3 - obj.Node4);
            area_2D = side1 * side2;
        end



 end
end
