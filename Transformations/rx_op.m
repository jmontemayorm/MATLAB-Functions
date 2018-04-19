function rx = rx_op(ALPHA,OPT1,OPT2)
    %RX_OP	Rotation operator matrix around the x-axis.
    %   Creates a rotation operator in 3D around the x-axis. Rotates ALPHA
    %   radians, unless specified by the options to rotate in degrees. It
    %   can also be specified to return an extended operator matrix
    %   (4-by-4), which is able to be combined with translation operators.
    %
    %   RX_OP(ALPHA) returns the 3D rotation matrix of ALPHA radians around
    %   the x-axis.
    %
    %   RX_OP(ALPHA,OPT1) and RX_OP(ALPHA,OPT1,OPT2) return the 3D rotation
    %   matrix around the x-axis, where OPT1 and OPT2 can be either
    %   'degrees' or 'extended'. If 'degrees' is one of the options, ALPHA
    %   is taken as an angle in degrees. If 'extended' is one of the
    %   options, the result is a 4-by-4 extended operator matrix.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.04.19
    %   Version: v1.3
    
    % Checks for the amount of input arguments and confirms the options.
    % Throws error message or returns the appropriate rotation matrix.
    if nargin == 1
        rx =  [1 0 0;...
            0 cos(ALPHA) -sin(ALPHA);...
            0 sin(ALPHA) cos(ALPHA)];
    elseif nargin == 2
        switch OPT1
            case 'degrees'
                ALPHA = ALPHA*pi/180.0;
                rx =  [1 0 0;...
                0 cos(ALPHA) -sin(ALPHA);...
                0 sin(ALPHA) cos(ALPHA)];
            case 'extended'
                rx =  [1 0 0 0;...
                0 cos(ALPHA) -sin(ALPHA) 0;...
                0 sin(ALPHA) cos(ALPHA) 0;...
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
        ALPHA = ALPHA*pi/180.0;
        rx =  [1 0 0 0;...
                0 cos(ALPHA) -sin(ALPHA) 0;...
                0 sin(ALPHA) cos(ALPHA) 0;...
                0 0 0 1];
    else
        error('The amount of input arguments does not match this function.');
    end
end