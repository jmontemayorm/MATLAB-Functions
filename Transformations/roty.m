function DATA = roty(DATA,BETA,OPT)
    %ROTY  Rotated data points around the y-axis.
    %   Rotates the given data by the specified angle around the y-axis.
    %   The rotation angle BETA is in radians, unless specified by OPT to
    %   be in degrees.
    %
    %   ROTY(DATA,BETA) returns the points in DATA, rotated an angle of
    %   BETA radians around the y-axis.
    %
    %   ROTY(DATA,BETA,OPT), with the specified option OPT being 'degrees',
    %   returns the points in DATA, rotated an angle of BETA degrees around
    %   the y-axis.
    
    %   Dependencies: ry_op
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.18
    %   Last updated: 2018.04.19
    %   Version: v1.0
    
    % Checks for the amount of input arguments and confirms the option.
    % Throws error message or returns the appropriate scaling matrix.
    if nargin == 2
        DATA = ry_op(BETA)*DATA;
    elseif nargin == 3
        if strcmpi('degrees',OPT)
            BETA = BETA*pi/180;
            DATA = ry_op(BETA)*DATA;
        else
            error('Option not recognized.');
        end
    else
        error('The amount of input arguments does not match this function.');
    end
end

