function [V,F] = trim_obj(VERTICES,FACES,BOUNDS,MODE)
    %TRIM_OBJ   Trims an object made out of vertices and faces.
    %   Trims the vertices inside the specified bounds, deleting the faces
    %   that reference them and shifing the vertex references in the faces
    %   accordingly. It can also trim everything outside the bounds if
    %   specified.
    %
    %   The argument BOUNDS is specified as a vector of length 6 with the
    %   corresponding bounds for [minX maxX minY maxY minZ maxZ]. If one of
    %   the components is not to be considered for the trim, it should be
    %   filled with NaN.
    %
    %   TRIM_OBJ(VERTICES,FACES,BOUNDS) trims the vertices inside the
    %   vertices inside the specified bounds and removes the faces that
    %   contain any of those vertices. Returns the updated vertices and
    %   faces matrices, respectively.
    %
    %   TRIM_OBJ(VERTICES,FACES,BOUNDS,MODE) may force the trim to keep the
    %   vertices inside the bounds and remove everything else when MODE is
    %   'k' (for keep). MODE can also be 'd' (for delete) to explicitly
    %   specify the deletion of what is inside the bounds.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.16
    %   Last updated: 2018.04.19
    %   Version: v1.1
    
    % Checks for the amount of input arguments and confirms the mode.
    % Throws error message or returns the trimmed data.
    if nargin == 3 || nargin == 4
        % Set the working mode
        if nargin == 4
            if MODE == 'd'
                dMode = true;
            elseif MODE == 'k'
                dMode = false;
            else
                error('Mode option not recognized.');
            end
        else
            dMode = true;
        end
        
        % Check that at least one of the bounds is not NaN
        if all(isnan(BOUNDS))
            error('At least one of the bounds must be a number.');
        end
        
        % Preallocate space to review the data
        v_is_used = false(length(VERTICES),1);
        v_skip = zeros(length(VERTICES),1); % Keeps track of displacement
        count_v = 0;
        count_skip = 0; % Used to keep track of the next displacements
        f_is_used = false(length(FACES),1);
        count_f = 0;
        
        % Review the vertices according to the selected mode
        if dMode % Delete what is inside
            for n = 1:length(VERTICES)
                if ~within_bounds(VERTICES(n,:),BOUNDS) % Outside bounds is kept
                    v_is_used(n) = true;
                    v_skip(n) = count_skip;
                    count_v = count_v + 1;
                else % Inside bounds is deleted
                    count_skip = count_skip - 1;
                end
            end
            
        else % Keep what is inside
            for n = 1:length(VERTICES)
                if within_bounds(VERTICES(n,:),BOUNDS) % Inside bounds is kept
                    v_is_used(n) = true;
                    v_skip(n) = count_skip;
                    count_v = count_v + 1;
                else % Outside bounds is deleted
                    count_skip = count_skip - 1;
                end
            end
        end
        
        % Review the faces
        for n = 1:length(FACES)
            % Check if the vertices are used
            is_v1 = v_is_used(FACES(n,1));
            is_v2 = v_is_used(FACES(n,2));
            is_v3 = v_is_used(FACES(n,3));

            % All must be used to keep the data
            is_v = is_v1 && is_v2 && is_v3;

            if is_v % Keep what is used
                f_is_used(n) = true;
                count_f = count_f + 1;
            end
        end
        
        % Preallocate space for the new vertices and faces
        V = zeros(count_v,3);
        count_v = 0; % Reset counter
        F = zeros(count_f,3);
        count_f = 0; % Reset counter

        % Fill new vertices
        for n = 1:length(VERTICES)
            if v_is_used(n)
                count_v = count_v + 1; % Update index

                % Fill the right data
                V(count_v,:) = VERTICES(n,:);
            end
        end
        
        % Fill new faces
        for n = 1:length(FACES)
            if f_is_used(n)
                count_f = count_f + 1; % Update index

                % Fill the right data
                F(count_f,1) = FACES(n,1) + v_skip(FACES(n,1));
                F(count_f,2) = FACES(n,2) + v_skip(FACES(n,2));
                F(count_f,3) = FACES(n,3) + v_skip(FACES(n,3));
            end
        end
        
    else
        error('The amount of input arguments does not match this function.');
    end
end

% Auxiliary function to determine wheter a point is inside the specified
% bounds
function within = within_bounds(v,bounds)
    check = ~isnan(bounds); % Bounds to consider
    is_in = false(6,1); % Preallocate check for conditions satisfaction
    
    % Check if the conditions are satisfied
    for m = 1:3
        % Check the minimum condition
        if check(2*m-1)
            if v(m) > bounds(2*m-1) % Greater than min
                is_in(2*m-1) = true;
            end
        end
        
        % Check the maximum condition
        if check(2*m)
            if v(m) < bounds(2*m) % Lesser than max
                is_in(2*m) = true;
            end
        end
    end
    
    % True if all the required conditions are satisfied
    within = all(is_in(check));
end