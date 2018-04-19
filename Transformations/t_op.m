function t = t_op(V)
    %T_OP	Translation operator matrix.
    %   Creates a translation operator matrix in 3D, which is of size
    %   4-by-4 and requires the data to be manipulated to be extended with
    %   a 4th dimentional row of ones.
    %
    %   T_OP(V) returns the 4-by-4 3D translation operator matrix where V
    %   is a 3D vector specifying the translation for each of the x, y, and
    %   z components, respectively.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.04.19
    %   Version: v1.2
    
    % Checks for the amount of input arguments and confirms size.
    % Throws error message or returns the appropriate translation matrix.
    if nargin == 1
        if numel(V) == 3
            t = [1 0 0 V(1);...
                0 1 0 V(2);...
                0 0 1 V(3);...
                0 0 0 1];
        else
            error('V must be a vector of length 3.');
        end
    else
        error('The number of input arguments does not match this function.');
    end
end