function [f,h,vertices,faces] = display_obj(fileName)
    %DISPLAY_OBJ Displays a .obj file using the patch function.
    %   Data is read using open_obj.m. Returns the figure handler
    %   (f), the patch handler (h) and the data extracted from the
    %   .obj file (vertices and faces).
    
    %   Author: Javier Montemayor Mancias
    %   Created on: 2018.03.19
    %   Last updated: 2018.03.19
    %   Version: v1.1
    
    [vertices,faces] = open_obj(fileName);
    f = figure();
    h = patch('Faces',faces,'Vertices',vertices);
    set(h,'FaceColor',[0.5, 0.6, 0.8],'EdgeColor','Black');
    axis equal
    grid on
    xlabel 'x'
    ylabel 'y'
    zlabel 'z'
end