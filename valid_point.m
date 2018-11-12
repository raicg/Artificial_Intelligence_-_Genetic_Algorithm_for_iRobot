function [ value ] = valid_point( x_inicial, y_inicial, move_x, move_y )
%VALID_POINT Summary of this function goes here
%   Detailed explanation goes here
walls = fopen('mapa4.txt','r');
line = "texto string";
while ~feof(walls)
    line = fgetl(walls);
    spl = strsplit(line);
    if strcmp(spl(1),'wall')
        wx1 = cellfun(@str2num,spl(2));
        wy1 = cellfun(@str2num,spl(3));
        wx2 = cellfun(@str2num,spl(4));
        wy2 = cellfun(@str2num,spl(5));
        %line
        %[start_x,start_y,move_x,move_y]
        valid_flag = lines_intersect(x_inicial,y_inicial,move_x,move_y,wx1,wy1,wx2,wy2);
        if valid_flag == 1
            value = 0;
            fclose(walls);
            return
        end
    end
end
fclose(walls);
value = 1;
end

