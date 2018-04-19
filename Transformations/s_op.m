function s = s_op(S,OPT)
    %S_OP	Scalaing operator matrix.
    %   Creates a scaling operator matrix in 3D, where the scaling can be
    %   uniform in all x, y, and z directions or specified individually. It
    %   can also be specified to return an extended operator matrix
    %   (4-by-4), which is able to be combined with translation operators.
    %
    %   S_OP(S) returns the 3D scaling operator matrix. S can either be a
    %   scalar that specifies uniform scaling, or a 3D vector specifying
    %   the scaling factor for each of the x, y, and z components,
    %   respectively.
    %
    %   S_OP(S,OPT) returns the same 3D operator matrix as S_OP(S) in an
    %   4-by-4 extended form, when OPT is specified as 'extended'.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.16
    %   Last updated: 2018.04.19
    %   Version: v1.2
    
    % Checks for the amount of input arguments and confirms the option.
    % Throws error message or returns the appropriate scaling matrix.
    if nargin == 1
        if numel(S) == 1
            s = [S 0 0;...
                0 S 0;...
                0 0 S];
        else
            s = [S(1) 0 0;...
                0 S(2) 0;...
                0 0 S(3)];
        end
    elseif nargin == 2
        if strcmpi(OPT,'extended')
            if numel(S) == 1
                s = [S 0 0 0;...
                    0 S 0 0;...
                    0 0 S 0;...
                    0 0 0 1];
            else
                s = [S(1) 0 0 0;...
                    0 S(2) 0 0;...
                    0 0 S(3) 0;...
                    0 0 0 1];
            end
        else
            error('Option not recognized.');
        end
    else
        error('The number of input arguments does not match this function.');
    end
end