function ru = ru_op(U,ALPHA,OPT1,OPT2)
    %RU_OP  Rotation operator matrix around arbitrary axis U.
    %   Creates a rotation operator in 3D around the arbitrary axis U.
    %   Rotates ALPHA radians, unless specified by the options to rotate in
    %   degrees. It can also be specified to return an extended operator
    %   matrix (4-by-4), which is able to be combined with translation
    %   operators.
    %
    %   RU_OP(U,ALPHA) returns the 3D rotation matrix of ALPHA radians
    %   around the U axis. U can either be a 3D vector that specifies the
    %   x, y, and z components (respectively) of the slope against the
    %   origin, or a 3-by-2 matrix that specifies the x, y, and z
    %   components (respectively) of a starting point (first column) and
    %   the slope (second column).
    %
    %   RU_OP(U,ALPHA,OPT1) and RU_OP(U,ALPHA,OPT1,OPT2) return the same as
    %   RU_OP(U,ALPHA), where OPT1 and OPT2 can either be 'degrees' or
    %   'extended'. If 'degrees' is one of the options, ALPHA is taken as
    %   an angle in degrees. If 'extended' is one of the options, the
    %   result is a 4-by-4 extended operator matrix.
    
    %   Dependencies: ry_op rz_op t_op
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.04.19
    %   Version: v1.1
    
    % Checks for the amount of input arguments and confirms the options.
    % Throws error message or returns the appropriate rotation matrix.
    if nargin < 2 || nargin > 4
        error('The amount of input arguments does not match this function.');
    else
        % Confirms valid size of u and extracts data
        if all(size(U) == [3,2])
            x = U(1,2);
            y = U(2,2);
            z = U(3,2);
            v = U(:,1);
            extended = true;
        elseif all(size(U) == [3,1])
            x = U(1);
            y = U(2);
            z = U(3);
            v = zeros(3,1); % In case 'extended' is specified as an option
            extended = false;
        else
            error('The size of U must match this function''s requirements.');
        end
        
        % Calculates the azimuthal and elevation angles
        az_angle = angle(x + 1i*y); % Measured from the + x-axis towards the + y-axis
        el_angle = angle(z + 1i*sqrt(x.^2+y.^2)); % Measured from the pole (+ z-axis) downwards
        
        % Checks for options
        if nargin == 3
            switch OPT1
                case 'extended'
                    extended = true;
                case 'degrees'
                    ALPHA = ALPHA*pi/180.0;
                otherwise
                    error('At least one of the options was not recognized.');
            end
        elseif nargin == 4
            switch OPT1
                case 'extended'
                    extended = true;
                    if all(OPT2 == 'degrees')
                        ALPHA = ALPHA*pi/180.0;
                    else
                        error('At least one of the options was not recognized.');
                    end
                case 'degrees'
                    ALPHA = ALPHA*pi/180.0;
                    if all(OPT2 == 'extended')
                        extended = true;
                    else
                        error('At least one of the options was not recognized.');
                    end
                otherwise
                    error('At least one of the options was not recognized.');
            end
        end
        
        % Performs the appropriate calculations if the matrix is to be
        % extended
        if extended
            % Calculate intermediate operators
            a_tr = t_op(-v); % Move to origin
            a_r_az = rz_op(-az_angle,'extended'); % Move az to the x-axis
            a_r_el = ry_op(-el_angle,'extended'); % Move el to the z-axis
            r_alph = rz_op(ALPHA,'extended'); % Perform rotation
            r_el = ry_op(el_angle,'extended'); % Restore el
            r_az = rz_op(az_angle,'extended'); % Restore az
            tr = t_op(v); % Restore position

            % Combine operators
            ru = tr*r_az*r_el*r_alph*a_r_el*a_r_az*a_tr;
        else
            % Calculate intermediate operators
            a_r_az = rz_op(-az_angle); % Move az to the x-axis
            a_r_el = ry_op(-el_angle); % Move el to the z-axis
            r_alph = rz_op(ALPHA); % Perform rotation
            r_el = ry_op(el_angle); % Restore el
            r_az = rz_op(az_angle); % Restore az
            
            % Combine operators
            ru = r_az*r_el*r_alph*a_r_el*a_r_az;
        end 
    end
end