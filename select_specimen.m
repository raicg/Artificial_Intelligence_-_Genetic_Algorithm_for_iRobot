function [ index ] = select_specimen( population_fitness )
%SELECT Summary of this function goes here
%   Detailed explanation goes here
    
    %Roaller coster (roleta) method to find the specimen
    %Weighted to the most probable to be accepted

    fitness = population_fitness;
    fitness = fitness/sum(fitness);
    %sum(fitness)
    fitness = max(fitness) - fitness;
    if sum(fitness)==0
        index = round(rand*(size(fitness)-1) + 1);
        index = index(1);
        return
    end
    fitness = fitness/sum(fitness);
    for i = 2:size(fitness)
        fitness(i) = fitness(i)+fitness(i-1);
    end
    %sum(fitness)
    
    %fitness
    alea = rand;
    for i = 1:size(fitness)
        if alea < fitness(i)
            index = i;
            break
        end
    end


end

