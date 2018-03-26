function rx_op = rx_operator(alpha,opt1,opt2)
    %RX_OPERATOR Creates a rotation operator in 3D around the x axis
    %   Rotates alpha radians, unless specified by the options to rotate
    %   in degrees. Can also be specified to return an extended operator
    %   matrix (4-by-4) so it's able to be combined with traslations.
    %
    %   RX_OPERATOR(alpha) returns the 3D rotation matrix of alpha radians
    %   around the x axis.
    %
    %   RX_OPERATOR(alpha,opt1) and RX_OPERATOR(alpha,opt1,opt2) return the
    %   3D rotation matrix around the x axis, where opt1 and opt2 can be
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
        rx_op =  [1 0 0;...
            0 cos(alpha) -sin(alpha);...
            0 sin(alpha) cos(alpha)];
    elseif nargin == 2
        switch opt1
            case 'degrees'
                alpha = alpha*pi/180.0;
                rx_op =  [1 0 0;...
                0 cos(alpha) -sin(alpha);...
                0 sin(alpha) cos(alpha)];
            case 'extended'
                rx_op =  [1 0 0 0;...
                0 cos(alpha) -sin(alpha) 0;...
                0 sin(alpha) cos(alpha) 0;...
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
        alpha = alpha*pi/180.0;
        rx_op =  [1 0 0 0;...
                0 cos(alpha) -sin(alpha) 0;...
                0 sin(alpha) cos(alpha) 0;...
                0 0 0 1];
    else
        error('Not enough input arguments.');
    end
    
end