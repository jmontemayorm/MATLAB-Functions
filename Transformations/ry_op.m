function ry = ry_op(BETA,OPT1,OPT2)
    %RY_OP  Rotation operator matrix around the y-axis.
    %   Creates a rotation operator in 3D around the y-axis. Rotates BETA
    %   radians, unless specified by the options to rotate in degrees. It
    %   can also be specified to return an extended operator matrix
    %   (4-by-4), which is able to be combined with translation operators.
    %
    %   RY_OP(BETA) returns the 3D rotation matrix of BETA radians around
    %   the y-axis.
    %
    %   RY_OP(BETA,OPT1) and RY_OP(BETA,OPT1,OPT2) return the 3D rotation
    %   matrix around the y-axis, where OPT1 and OPT2 can be either
    %   'degrees' or 'extended'. If 'degrees' is one of the options, BETA
    %   is taken as an angle in degrees. If 'extended' is one of the
    %   options, the result is a 4-by-4 extended operator matrix.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.04.19
    %   Version: v1.3
    
    % Checks for the amount of input arguments and confirms the options.
    % Throws error message or returns the appropriate rotation matrix.
    if nargin == 1
        ry =  [cos(BETA) 0 sin(BETA);...
            0 1 0;...
            -sin(BETA) 0 cos(BETA)];
    elseif nargin == 2
        switch OPT1
            case 'degrees'
                BETA = BETA*pi/180.0;
                ry =  [cos(BETA) 0 sin(BETA);...
                0 1 0;...
                -sin(BETA) 0 cos(BETA)];
            case 'extended'
                ry =  [cos(BETA) 0 sin(BETA) 0;...
                0 1 0 0;...
                -sin(BETA) 0 cos(BETA) 0;...
                0 0 0 1];
            otherwise
                error('Option not recognized.');
        end
    elseif nargin == 3
        switch OPT1
            case 'degrees'
                if OPT2 ~= 'extended'
                    error('Option not recognized.');
                end
            case 'extended'
                if OPT2 ~= 'degrees'
                    error('Option not recognized.');
                end
            otherwise
                error('Option not recognized.');
        end
        BETA = BETA*pi/180.0;
        ry =  [cos(BETA) 0 sin(BETA) 0;...
                0 1 0 0;...
                -sin(BETA) 0 cos(BETA) 0;...
                0 0 0 1];
    else
        error('The amount of input arguments does not match this function.');
    end
    
end