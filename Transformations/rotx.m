function DATA = rotx(DATA,ALPHA,OPT)
    %ROTX  Rotated data points around the x-axis.
    %   Rotates the given data by the specified angle around the x-axis.
    %   The rotation angle ALPHA is in radians, unless specified by OPT to
    %   be in degrees.
    %
    %   ROTX(DATA,ALPHA) returns the points in DATA, rotated an angle of
    %   ALPHA radians around the x-axis.
    %
    %   ROTX(DATA,ALPHA,OPT), with the specified option OPT being
    %   'degrees', returns the points in DATA, rotated an angle of ALPHA
    %   degrees around the x-axis.
    
    %   Dependencies: rx_op
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.18
    %   Last updated: 2018.04.19
    %   Version: v1.0
    
    % Checks for the amount of input arguments and confirms the option.
    % Throws error message or returns the appropriate scaling matrix.
    if nargin == 2
        DATA = rx_op(ALPHA)*DATA;
    elseif nargin == 3
        if strcmpi('degrees',OPT)
            ALPHA = ALPHA*pi/180;
            DATA = rx_op(ALPHA)*DATA;
        else
            error('Option not recognized.');
        end
    else
        error('The amount of input arguments does not match this function.');
    end
end

