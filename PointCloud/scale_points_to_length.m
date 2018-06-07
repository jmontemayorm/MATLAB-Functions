function DATAPOINTS = scale_points_to_length(DATAPOINTS,AX,L)
    %SCALE_POINTS_TO_LENGTH	Scales a 3D point cloud by setting the length
    %of an axis to a known size.
    %   Takes as input a 3-by-n matrix of points containing x, y, and z
    %   coordinates in each row, respectively, and scales the cloud by
    %   making the distance between the highest and lowest point in the
    %   selected axis the size of the input length.
    %
    %   SCALE_POINTS_TO_LENGTH(DATAPOINTS,AX,L) returns the scaled points,
    %   where AX is 1, 2 or 3, for x, y or z, respectively, and L is the
    %   desired length of the object in that axis.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.26
    %   Last updated: 2018.04.26
    %   Version: v1.0
    
    DATAPOINTS = DATAPOINTS * L / ...
        (max(DATAPOINTS(AX,:)) - min(DATAPOINTS(AX,:)));
end