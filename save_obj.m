function save_obj(FILEPATH,FILENAME,VERTICES,FACES,HEADER)
    %SAVE_OBJ   Saves a 3D object described by vertices and faces in a .obj
    %file.
    %   Saves the 3D object in a .obj file by the name FILENAME (if it
    %   doesn't have the extention, it's added automatically) and under the
    %   path FILEPATH. VERTICES and FACES must be n-by-3 and m-by-3
    %   matrices. For more information on .obj files see:
    %   https://en.wikipedia.org/wiki/Wavefront_.obj_file
    %
    %   SAVE_OBJ(FILEPATH,FILENAME,VERTICES,FACES) saves the object
    %   described by VERTICES and FACES under the name FILENAME in the path
    %   specified by FILEPATH (which is created in case it doesn't exist).
    %   FILEPATH can be and empty char array '' when saving directly into
    %   the main folder of the working directory.
    %
    %   SAVE_OBJ(...,HEADER) adds a comment HEADER into the top of the
    %   file. The comment must be a char array and need not contain the
    %   comment symbol for it is added automatically.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.04.16
    %   Last updated: 2018.04.19
    %   Version: v1.2
    
    % Checks for the amount of input arguments..
    % Throws error message or succesfully saves the file.
    if nargin == 4 || nargin == 5
        % Check that FILENAME has .obj at the end, if not, add it
        if length(FILENAME) > 4
            if ~strcmpi(FILENAME(end-3:end),'.obj')
                FILENAME = [FILENAME '.obj'];
            end
        end
        
        % Check if directory exists, if not, it creates it
        if ~isempty(FILEPATH)
            if exist(FILEPATH,'dir') ~= 7
                mkdir(FILEPATH);
            end
        end
        
        % Full path and name
        pathAndName = fullfile(FILEPATH,FILENAME);
        
        % Try to open the file in write mode, discarding previous
        % contents, without automatic flushing
        fID = fopen(pathAndName,'W+');
        if fID ~= -1
            % Write the header
            if nargin == 5
                fprintf(fID,['# ' HEADER '\n']);
            end
            fprintf(fID,'# Created with MATLAB\n\n');
            
            % Write the vertcies
            fprintf(fID,'# List of geometric vertices, with (x,y,z) coordinates:\n');
            fprintf(fID,'v %f %f %f\n',VERTICES);
            fprintf(fID,'# %i vertices\n\n',size(VERTICES,1));
            
            % Write the faces
            fprintf(fID,'# List of triangles:\n');
            fprintf(fID,'f %i %i %i\n',FACES);
            fprintf(fID,'# %i faces',size(FACES,1));
            
            % Close the file
            fclose(fID);
        else
            error('Error opening the file.');
        end
    else
        error('The amount of input arguments does not match this function.');
    end
end