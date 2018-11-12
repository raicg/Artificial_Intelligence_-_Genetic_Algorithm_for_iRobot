function [ fitness ] = get_fitness( desired_x,desired_y,population_size,path_size, population )
%GET_FITNESS Summary of this function goes here
%   Detailed explanation goes here
    fitness = [];
    for i = 1:population_size
        dude = population{i};
        dist_fit = 0;
        for j = 1:path_size
            dist_fit = dist_fit + sqrt(sum((dude(j,:) - dude(j+1,:)) .^ 2));
        end
        goal_fit = sqrt(sum((dude(path_size+1,:) - [desired_x desired_y]) .^ 2));
        %goal_fit
        %dist_fit/(path_size+1)
        %make the goal more important than the distance travelled
        final_fit = 2*goal_fit + dist_fit/(path_size+1);

        fitness = [fitness ; final_fit];
    end

end

