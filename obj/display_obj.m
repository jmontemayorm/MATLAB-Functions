function varargout = display_obj(ARG1,ARG2,ARG3)
    %DISPLAY_OBJ    Displays a 3D object composed of vertices and faces.
    %   Uses the patch function to display a 3D object composed of vertices
    %   and faces, either entered as argument, or read from the file whose
    %   name (and path) is indicated as an argument. Can also be displayed
    %   into an existing figure. Returns the data if not provided, the
    %   patch handle, and the figure hanlde if no figure was specified as
    %   input.
    %
    %   DISPLAY_OBJ(ARG1) takes the argument ARG1 as the name (and path) of
    %   a .obj file, reads it, and displays it. Returns the vertices,
    %   faces, patch handle and figure handle, respectively.
    %
    %   DISPLAY_OBJ(ARG1,ARG2) takes the arguments ARG1 and ARG2 which can
    %   either be the vertices and faces of an object, respectively, or the
    %   filename (and path) of a .obj file and a figure handle (or number),
    %   respectively. In the case of input of the vertices and faces, the
    %   output arguments are the patch and figure handles, respectively. In
    %   the other case, the output arguments are the vertices, faces and
    %   patch handle, respectively.
    %
    %   DISPLAY_OBJ(ARG1,ARG2,ARG3) takes as arguments ARG1, ARG2 and ARG3
    %   the vertices, faces, and figure hanlde (or number), respectively,
    %   and returns as only output the patch handle.
    
    %   Dependencies: open_obj.m
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.19
    %   Last updated: 2018.04.20
    %   Version: v2.1
    
    % Checks for the amount of input arguments
    if nargin == 1
        % Only one argument provided, open .obj file and display
        
    	[varargout{1},varargout{2}] = open_obj(ARG1);
        
        varargout{4} = figure;
        varargout{3} = patch('Faces',varargout{2},'Vertices',varargout{1});
        set(varargout{3},'FaceColor',[0.5, 0.6, 0.8],'EdgeColor','Black')
        set(varargout{3},'EdgeAlpha',0.2)
        
        % This option returns the vertices and faces as first and second
        % outputs, and the patch and figure handles as thrid and fourth
    elseif nargin == 2
        % Two arguments provided, either data, or name and figure
        
        % Checks the format of the data, if ARG1 is numeric, should be data
        if isnumeric(ARG1)
            vertices = ARG1;
            faces = ARG2;
            
            varargout{2} = figure;
            varargout{1} = patch('Faces',faces,'Vertices',vertices);
            set(varargout{1},'FaceColor',[0.5, 0.6, 0.8],'EdgeColor','Black')
            set(varargout{1},'EdgeAlpha',0.2)
            
            % This option returns the patch handle as first output and the
            % figure handle as second
        else
            [varargout{1},varargout{2}] = open_obj(ARG1);
        
            figure(ARG2)
            hold on
            varargout{3} = patch('Faces',varargout{2},'Vertices',varargout{1});
            set(varargout{3},'FaceColor',[0.5, 0.6, 0.8],'EdgeColor','Black')
            set(varargout{3},'EdgeAlpha',0.2)
            
            % This option returns the vertices and faces as first and
            % second outputs, and the patch handle as a third one
        end
        
    elseif nargin == 3
        % Three arguments provided, data and figure
        
        vertices = ARG1;
        faces = ARG2;
        
        figure(ARG3)
        hold on
        varargout{1} = patch('Faces',faces,'Vertices',vertices);
        set(varargout{1},'FaceColor',[0.5, 0.6, 0.8],'EdgeColor','Black')
        set(varargout{1},'EdgeAlpha',0.2)
        
        % This option returns the patch handle as the only output
    else
        error('The amount of input arguments does not match this function.');
    end
    
    % Settings for any number of valid input arguments
    axis equal
    grid on
    xlabel 'x'
    ylabel 'y'
    zlabel 'z'
    view(-30,30)
end