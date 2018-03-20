function [vertices,faces] = open_obj(fileName)
    %OPEN_OBJ Opens and reads the .obj (Wavefront) file, returning
    %   the vertices and faces. Does not make use of the associated
    %   .mlt and .png files, nor does it read data other than what
    %   it returns.
    %   This function is currently compatible only with triangular
    %   faces (3 vertices per face).
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.19
    %   Last updated: 2018.03.19
    %   Version: v1.0
    
    % Checks if the number of arguments match the function
    if nargin == 1
        % Checks if the file exists
        if exist(fileName,'file')
            % Opens the file and checks if there were any errors
            fileID = fopen(fileName);
            if fileID >= 3
                % Initializes vectors to store the lines with useful data
                verticesLines(1) = "";
                facesLines(1) = "";
                
                % Initializes counters to keep track of the arrays
                countV = 0;
                countF = 0;
                
                % Gets the first line of the file
                tline = fgetl(fileID);
                
                % Loops through the file extracting raw data
                while ischar(tline)
                    % Checks if the line is not empty
                    if ~isempty(tline)
                        % Checks if the current line has vertices or faces
                        if all(tline(1:2) == 'v ')
                            countV = countV + 1;
                            verticesLines(countV,1) = strrep(tline,'v ','');
                        elseif all(tline(1:2) == 'f ')
                            countF = countF + 1;
                            facesLines(countF,1) = strrep(tline,'f ','');
                        end
                    end
                    
                    % Goes to the next line
                    tline = fgetl(fileID);
                end
                
                % Allocates space for the string extraction
                strV = strings(countV,3);
                strF = strings(countF,3);
                
                % Extracts the vertices into the return matrix
                strV(1:countV,1) = extractBefore(...
                    verticesLines(1:countV),' ');
                strV(1:countV,2) = extractBetween(...
                    verticesLines(1:countV),' ',' ');
                strV(1:countV,3) = extractAfter(...
                    verticesLines(1:countV),strV(1:countV,2));
                vertices = str2double(strV);
                
                % Extracts the faces into the return matrix, checking if
                % there are '/' in the string so it can ignore them
                if ~contains(extractBefore(facesLines(1),' '),'/')
                    strF(1:countF,1) = extractBefore(...
                        facesLines(1:countF),' ');
                    strF(1:countF,2) = extractBetween(...
                        facesLines(1:countF),' ',' ');
                    strF(1:countF,3) = extractAfter(...
                        facesLines(1:countF),strF(1:countF,2));
                else
                    strF(1:countF,1) = extractBefore(...
                        facesLines(1:countF),'/');
                    strF(1:countF,2:3) = extractBetween(...
                        facesLines(1:countF),' ','/');
                end
                faces = str2double(strF);
                
                % Closes the file
                fclose(fileID);
            else
                error('There was an error opening the file.');
            end
        else
            error('File not found.');
        end
    else
        error('The number of arguments does not match this function.');
    end
end