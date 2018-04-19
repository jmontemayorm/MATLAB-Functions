function [vertices,faces] = open_obj(FILENAME)
    %OPEN_OBJ   Reads the data from a .obj file.
    %   Opens and reads a .obj (Wavefront) file, returning the vertices and
    %   faces. It is only compatible with objects created out of triangluar
    %   faces and that do not contain a w value in the vertices. Also
    %   incompatible with objects that contain texture information in the
    %   faces. For more information on .obj files see:
    %   https://en.wikipedia.org/wiki/Wavefront_.obj_file
    %
    %   OPEN_OBJ(FILENAME) returns the [vertices,faces] described by the
    %   .obj file called FILENAME. If the file is inside the working
    %   directory, no path is required, if it's not, the path to the file
    %   must be included in FILENAME.
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.19
    %   Last updated: 2018.03.19
    %   Version: v1.1
    
    % Checks for the amount of input arguments and for the existence of the
    % file. Attempts to read. Throws error message or returns the read
    % data.
    if nargin == 1
        if exist(FILENAME,'file')
            % Opens the file and checks if there were any errors
            fID = fopen(FILENAME);
            if fID >= 3
                % Gets the data
                data = textscan(fID,'%s %f %f %f','CommentStyle','#');
                
                % Gets the indices of vertices and faces
                vIdx = cell2mat(data{1}) == 'v';
                fIdx = cell2mat(data{1}) == 'f';
                
                % Extracts vertices and faces
                vertices = [data{2}(vIdx) data{3}(vIdx) data{4}(vIdx)];
                faces = [data{2}(fIdx) data{3}(fIdx) data{4}(fIdx)];
                
                % Closes the file
                fclose(fID);
            else
                error('There was an error opening the file.');
            end
        else
            error('File not found.');
        end
    else
        error('The amount of input arguments does not match this function.');
    end
end