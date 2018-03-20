function s_op = s_operator(s,opt1)
    %S_OPERATOR Creates a scale operator in 3D. The output is either
    %   a 3-by-3 or a 4-by-4 matrix that can be combined with other
    %   affine transformation operators. Takes a vector s of length 3
    %   as the input for the x, y and z ratios. If the input is not a
    %   vector all the ratios are taken as s. The argument opt1
    %   specifies if the matrix should be extended.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.03.19
    %   Version: v1.0
    
    % Checks for the amount of input arguments..
    % Throws error message or returns the adecuate translation matrix.
    if nargin == 1
        if numel(s) == 1
            s_op = [s 0 0;...
                0 s 0;...
                0 0 s];
        else
            s_op = [s(1) 0 0;...
                0 s(2) 0;...
                0 0 s(3)];
        end
    elseif nargin == 2
        if all(opt1 == 'extended')
            if numel(s) == 1
                s_op = [s 0 0 0;...
                    0 s 0 0;...
                    0 0 s 0;...
                    0 0 0 1];
            else
                s_op = [s(1) 0 0 0;...
                    0 s(2) 0 0;...
                    0 0 s(3) 0;...
                    0 0 0 1];
            end
        else
            error('Option not recognized.');
        end
    else
        error('The number of inputs does not match this function.');
    end
end