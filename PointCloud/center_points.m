function DATAPOINTS = center_points(DATAPOINTS)
    %CENTER_POINTS Centers a 3D point cloud in the origin.
    %   Takes as input a 3-by-n matrix of points containing x, y, and z
    %   coordinates in each row, respectively, and centers the cloud
    %   according to the mean of all the points.
    %
    %   CENTER_POINTS(DATAPOINTS) returns the centered points.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.20
    %   Last updated: 2018.04.20
    %   Version: v1.0
    
    DATAPOINTS = DATAPOINTS - repmat(mean(DATAPOINTS,2),1,size(DATAPOINTS,2));
end

