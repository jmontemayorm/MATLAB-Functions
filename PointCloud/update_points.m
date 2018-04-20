function update_points(SCATTER3_H,DATAPOINTS)
    %UPDATE_POINTS	Updates the point cloud being displayed by a scatter3
    %handler.
    %   Updates the data being displayed by the scatter3 handler passed as
    %   first input, with the updated point cloud passed as second input.
    %
    %   UPDATE_POINTS(SCATTER3_H,DATAPOINTS) updates the x, y, and z
    %   components of the data being displayed by the scatter3 handler.
    %   This can be used after the data has been transformed in space.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.20
    %   Last updated: 2018.04.20
    %   Version: v1.0
    
     % Checks for the amount of input arguments
    if nargin == 2
        SCATTER3_H.XData = DATAPOINTS(1,:);
        SCATTER3_H.YData = DATAPOINTS(2,:);
        SCATTER3_H.ZData = DATAPOINTS(3,:);
    else
        error('The amount of input arguments does not match this function.');
    end
end

