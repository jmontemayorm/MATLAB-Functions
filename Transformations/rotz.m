function DATA = rotz(DATA,GAMMA,OPT)
    %ROTZ  Rotated data points around the z-axis.
    %   Rotates the given data by the specified angle around the z-axis.
    %   The rotation angle GAMMA is in radians, unless specified by OPT to
    %   be in degrees.
    %
    %   ROTZ(DATA,GAMMA) returns the points in DATA, rotated an angle of
    %   GAMMA radians around the z-axis.
    %
    %   ROTZ(DATA,GAMMA,OPT), with the specified option OPT being
    %   'degrees', returns the points in DATA, rotated an angle of GAMMA
    %   degrees around the z-axis.
    
    %   Dependencies: rz_op
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.18
    %   Last updated: 2018.04.19
    %   Version: v1.0
    
    % Checks for the amount of input arguments and confirms the option.
    % Throws error message or returns the appropriate scaling matrix.
    if nargin == 2
        DATA = rz_op(GAMMA)*DATA;
    elseif nargin == 3
        if strcmpi('degrees',OPT)
            GAMMA = GAMMA*pi/180;
            DATA = rz_op(GAMMA)*DATA;
        else
            error('Option not recognized.');
        end
    else
        error('The amount of input arguments does not match this function.');
    end
end

