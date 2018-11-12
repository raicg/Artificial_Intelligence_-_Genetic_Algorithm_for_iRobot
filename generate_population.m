function [ population ] = generate_population( start_x, start_y, population_size, path_size )
%GENERATE_POPULATION Summary of this function goes here
%   Detailed explanation goes here

temp_start_x = start_x;

population = cell(population_size,1);
for j = 1:population_size
    i = 0;
    x = start_x;
    y = start_y;
    prev_x = x;
    prev_y = y;

    while i < path_size
        
        temp_x = prev_x;
        temp_y = prev_y;
        move_x = rand*8 - 4;
        move_y = rand*8 - 4;

        isvalid = valid_point(temp_x,temp_y,move_x,move_y);
        if isvalid == 1
            x = [x;move_x];
            y = [y;move_y];
            %plot(x,y);
            prev_x = move_x;
            prev_y = move_y;
            i = i+1;
        end
    end
population{j} = [x y]; 
end

end

