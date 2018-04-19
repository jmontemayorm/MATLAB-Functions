function rz = rz_op(GAMMA,OPT1,OPT2)
    %RZ_OP  Rotation operator matrix around the z-axis.
    %   Creates a rotation operator in 3D around the z-axis. Rotates GAMMA
    %   radians, unless specified by the options to rotate in degrees. It
    %   can also be specified to return an extended operator matrix
    %   (4-by-4), which is able to be combined with translation operators.
    %
    %   RZ_OP(GAMMA) returns the 3D rotation matrix of GAMMA radians around
    %   the z-axis.
    %
    %   RZ_OP(GAMMA,OPT1) and RZ_OP(GAMMA,OPT1,OPT2) return the 3D rotation
    %   matrix around the z-axis, where OPT1 and OPT2 can be either
    %   'degrees' or 'extended'. If 'degrees' is one of the options, GAMMA
    %   is taken as an angle in degrees. If 'extended' is one of the
    %   options, the result is a 4-by-4 extended operator matrix.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.04.19
    %   Version: v1.3
    
    % Checks for the amount of input arguments and confirms the options.
    % Throws error message or returns the appropriate rotation matrix.
    if nargin == 1
        rz =  [cos(GAMMA) -sin(GAMMA) 0;...
            sin(GAMMA) cos(GAMMA) 0;...
            0 0 1];
    elseif nargin == 2
        switch OPT1
            case 'degrees'
                GAMMA = GAMMA*pi/180.0;
                rz =  [cos(GAMMA) -sin(GAMMA) 0;...
                sin(GAMMA) cos(GAMMA) 0;...
                0 0 1];
            case 'extended'
                rz =  [cos(GAMMA) -sin(GAMMA) 0 0;...
                sin(GAMMA) cos(GAMMA) 0 0;...
                0 0 1 0;...
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
        GAMMA = GAMMA*pi/180.0;
        rz = [cos(GAMMA) -sin(GAMMA) 0 0;...
                        sin(GAMMA) cos(GAMMA) 0 0;...
                        0 0 1 0;...
                        0 0 0 1];
    else
        error('The amount of input arguments does not match this function.');
    end
    
end