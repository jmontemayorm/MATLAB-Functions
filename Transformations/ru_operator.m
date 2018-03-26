function ru_op = ru_operator(u,alpha,opt1,opt2)
    %RU_OPERATOR Creates a rotation operator in 3D around the line
    %   described by u. u is either a 3-by-2 matrix describing a starting
    %   point u(:,1) and a direction vector u(:,2), or a 3-by-1 vector
    %   describing a direction vector from the origin. The argument alpha
    %   provides the rotation angle in radians, with the option of being
    %   specified in degrees by either opt1 or opt2. If u is a 3-by-1
    %   vector the default output is a 3-by-3 matrix, with the option of
    %   being specified to be affine (4-by-4) by either opt1 or opt2. If u
    %   is a 3-by-2 matrix, the output is affine (whether explicitly
    %   specified in as argument or not).
    %
    %   RU_OPERATOR(u,alpha) returns the rotation matrix of alpha radians
    %   around the line described by u (starting point and direction vector
    %   or direction vector from the origin).
    %
    %   RU_OPERATOR(u,alpha,opt1) and RU_OPERATOR(u,alpha,opt1,opt2) return
    %   the same result of RU_OPERATOR(u,alpha) with the options of alpha
    %   being in degrees and/or forcing an affine matrix as output. opt1
    %   and opt2 accept the input 'degrees' or 'extended'.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.03.26
    %   Version: v1.0
    
    % Checks for the amount of input arguments
    if nargin < 2 || nargin > 4
        error('The amount of input arguments does not match this function.');
    else
        % Confirms valid size of u and extracts data
        if all(size(u) == [3,2])
            x = u(1,2);
            y = u(2,2);
            z = u(3,2);
            v = u(:,1);
            extended = true;
        elseif all(size(u) == [3,1])
            x = u(1);
            y = u(2);
            z = u(3);
            v = zeros(3,1); % In case 'extended' is specified as an option
            extended = false;
        else
            error('The size of u must match this function.');
        end
        
        % Calculates the azimuthal and elevation angles
        az_angle = angle(x + 1i*y); % Measured from the + x-axis towards the + y-axis
        el_angle = angle(z + 1i*sqrt(x.^2+y.^2)); % Measured from the pole (+ z-axis) downwards
        
        % Checks for options
        if nargin == 3
            switch opt1
                case 'extended'
                    extended = true;
                case 'degrees'
                    alpha = alpha*pi/180.0;
                otherwise
                    error('At least one of the options was not recognized.');
            end
        elseif nargin == 4
            switch opt1
                case 'extended'
                    extended = true;
                    if all(opt2 == 'degrees')
                        alpha = alpha*pi/180.0;
                    else
                        error('At least one of the options was not recognized.');
                    end
                case 'degrees'
                    alpha = alpha*pi/180.0;
                    if all(opt2 == 'extended')
                        extended = true;
                    else
                        error('At least one of the options was not recognized.');
                    end
                otherwise
                    error('At least one of the options was not recognized.');
            end
        end
        
        % Performs the appropriate calculations if the matrix is to be
        % affine
        if extended
            % Calculate intermediate operators
            a_tr = t_operator(-v); % Move to origin
            a_r_az = rz_operator(-az_angle,'extended'); % Move az to the x-axis
            a_r_el = ry_operator(-el_angle,'extended'); % Move el to the z-axis
            r_alph = rz_operator(alpha,'extended'); % Perform rotation
            r_el = ry_operator(el_angle,'extended'); % Restore el
            r_az = rz_operator(az_angle,'extended'); % Restore az
            tr = t_operator(v); % Restore position

            % Combine operators
            ru_op = tr*r_az*r_el*r_alph*a_r_el*a_r_az*a_tr;
        else
            % Calculate intermediate operators
            a_r_az = rz_operator(-az_angle); % Move az to the x-axis
            a_r_el = ry_operator(-el_angle); % Move el to the z-axis
            r_alph = rz_operator(alpha); % Perform rotation
            r_el = ry_operator(el_angle); % Restore el
            r_az = rz_operator(az_angle); % Restore az
            
            % Combine operators
            ru_op = r_az*r_el*r_alph*a_r_el*a_r_az;
        end 
    end
end