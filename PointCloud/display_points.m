function varargout = display_points(DATAPOINTS,FIGURE)
    %DISPLAY_POINTS Displays a 3D point cloud.
    %   Uses the scatter3 function to display the point cloud in
    %   DATAPOINTS. A figure number or figure handler can be specified as
    %   an input to display the data in that specific figure, in that case,
    %   previous objects will be held.
    %
    %   DISPLAY_POINTS(DATAPOINTS) returns the scatter3 handler and the
    %   figure handler, respectively, and takes as input a 3-by-n datapoint
    %   matrix containing the x, y, and z components in each row,
    %   respectively.
    %
    %   DISPLAY_POINTS(DATAPOINTS,FIGURE) returns only the scatter3 handler
    %   and takes as second input the desired figure number or figure
    %   handler.
    %
    %   Computer Vision System Toolbox's point cloud functions not used for
    %   lack of support of a handler to update manipulated data while
    %   keeping other objects in the same figure.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.20
    %   Last updated: 2018.04.20
    %   Version: v1.0
    
    % Checks for the amount of input arguments and uses or creates a figure
    if nargin == 1
        varargout{2} = figure;
    elseif nargin == 2
        figure(FIGURE)
        hold on
    else
        error('The amount of input arguments does not match this function.');
    end
    
    % Displays the data and creates a handle
    varargout{1} = ...
        scatter3(DATAPOINTS(1,:),DATAPOINTS(2,:),DATAPOINTS(3,:),'.','MarkerEdgeColor',[0,0.4470,0.7410]);
    axis equal
    grid on
    xlabel 'x'
    ylabel 'y'
    zlabel 'z'
    view(-30,30)
end

