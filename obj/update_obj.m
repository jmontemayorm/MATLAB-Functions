function update_obj(PATCH_H,VERTICES,FACES)
    %UPDATE_OBJ	Updates the data being displayed by a patch handler.
    %   Updates the data being displayed by the patch handler passed as
    %   first input, with the vertices passed as second input and,
    %   optionally, the faces passed as third input.
    %
    %   UPDATE_OBJ(PATCH_H,VERTICES) updates the vertices component of the
    %   patch handler. This can be used when the object keeps the same
    %   number of vertices and faces but is transformed in space.
    %
    %   UPDATE_OBJ(PATCH_H,VERTICES,FACES) updates the vertices and faces
    %   of the object being displayed by the patch handler. This can be
    %   used when the object has been trimmed and hence, both the vertices
    %   and faces have gone through changes.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.20
    %   Last updated: 2018.04.20
    %   Version: v1.0
    
    % Checks for the amount of input arguments
    if nargin == 2
        PATCH_H.Vertices = VERTICES;
    elseif nargin == 3
        PATCH_H.Vertices = VERTICES;
        PATCH_H.Faces = FACES;
    else
        error('The amount of input arguments does not match this function.');
    end
end