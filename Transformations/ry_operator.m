function ry_op = ry_operator(beta,opt1,opt2)
    %RY_OPERATOR Creates a rotation operator in 3D around the y axis
    %   Rotates beta radians, unless specified by the options to rotate
    %   in degrees. Can also be specified to return an extended operator
    %   matrix (4-by-4) so it's able to be combined with traslations.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.03.19
    %   Version: v1.0
    
    % Checks for the amount of input arguments and confirms the options.
    % Throws error message or returns the adecuate rotation matrix.
    if nargin == 1
        ry_op =  [cos(beta) 0 sin(beta);...
            0 1 0;...
            -sin(beta) 0 cos(beta)];
    elseif nargin == 2
        switch opt1
            case 'degrees'
                beta = beta*180.0/pi;
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
        beta = beta*180.0/pi;
        ry_op =  [cos(beta) 0 sin(beta) 0;...
                0 1 0 0;...
                -sin(beta) 0 cos(beta) 0;...
                0 0 0 1];
    else
        error('Not enough input arguments.');
    end
    
end