function t_op = t_operator(v)
    %T_OPERATOR Creates a translation operator in 3D. The output is a
    %   4-by-4 affine matrix that can be combined with other affine
    %   transformation operators. Takes a vector v of length 3 as the
    %   input for the x, y and z translations.
    %
    %   T_OPERATOR(v) returns the 4-by-4 3D translation matrix where v is
    %   a vector of length 3 specifying the translation for each of the x,
    %   y and z components, respectively. 
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.03.26
    %   Version: v1.1
    
    % Checks for the amount of input arguments..
    % Throws error message or returns the appropriate translation matrix.
    if nargin ~= 1
        error('The number of inputs does not match this function.')
    else
        t_op = [1 0 0 v(1);...
            0 1 0 v(2);...
            0 0 1 v(3);...
            0 0 0 1];
    end
end