function ry_op = ry_operator(beta,opt1,opt2)
    %RY_OPERATOR Creates a rotation operator in 3D around the y-axis
    %   Rotates beta radians, unless specified by the options to rotate
    %   in degrees. Can also be specified to return an extended operator
    %   matrix (4-by-4) so it's able to be combined with traslations.
    %
    %   RY_OPERATOR(beta) returns the 3D rotation matrix of beta radians
    %   around the y-axis.
    %
    %   RY_OPERATOR(beta,opt1) and RY_OPERATOR(beta,opt1,opt2) return the
    %   3D rotation matrix around the y-axis, where opt1 and opt2 can be
    %   either 'degrees' or 'extended'. If 'degrees' is one of the options
    %   the rotation is performed in degrees. If 'extended' is one of the
    %   options, the result is a 4-by-4 affine matrix.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.03.26
    %   Version: v1.2
    
    % Checks for the amount of input arguments and confirms the options.
    % Throws error message or returns the appropriate rotation matrix.
    if nargin == 1
        ry_op =  [cos(beta) 0 sin(beta);...
            0 1 0;...
            -sin(beta) 0 cos(beta)];
    elseif nargin == 2
        switch opt1
            case 'degrees'
                beta = beta*pi/180.0;
                ry_op =  [cos(beta) 0 sin(beta);...
                0 1 0;...
                -sin(beta) 0 cos(beta)];
            case 'extended'
                ry_op =  [cos(beta) 0 sin(beta) 0;...
                0 1 0 0;...
                -sin(beta) 0 cos(beta) 0;...
                0 0 0 1];
            otherwise
                error('Option not recognized.');
        end
    elseif nargin == 3
        switch opt1
            case 'degrees'
                if opt2 ~= 'extended'
                    error('Option not recognized.');
                end
            case 'extended'
                if opt2 ~= 'degrees'
                    error('Option not recognized.');
                end
            otherwise
                error('Option not recognized.');
        end
        beta = beta*pi/180.0;
        ry_op =  [cos(beta) 0 sin(beta) 0;...
                0 1 0 0;...
                -sin(beta) 0 cos(beta) 0;...
                0 0 0 1];
    else
        error('The amount of input arguments does not match this function.');
    end
    
end