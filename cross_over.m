function [ resultado_cross_over ] = cross_over( input_populacao, input_fitness, input_tamanho_caminho )
    %Armazena os valores de entrada
    populacao = input_populacao;
    fitness = input_fitness;
    tamanho_caminho = input_tamanho_caminho;
    
    %Parametro para identificar se o caminho e possivel,
    %se for deve permanecer 0
    caminho_valido = 0;
    while caminho_valido == 0
        %funcao roleta
        s1 = select_specimen(fitness);
        s2 = s1;
        debug_count = 5;
        while s2 == s1 && debug_count >= 1
            debug_count = debug_count - 1;
            s2 = select_specimen(fitness);
        end
        if debug_count == 0
            %Needs to check if its the last position
            s2 = s1+1;
        end

        div_point = round(rand*(tamanho_caminho-1) + 1);

        s1x = populacao{s1}(div_point,1,:);
        s1y = populacao{s1}(div_point,2,:);
        s2x = populacao{s2}(div_point+1,1,:);
        s2y = populacao{s2}(div_point+1,2,:);

        caminho_valido = valid_point(s1x,s1y,s2x,s2y);
    end
    resultado_cross_over = [populacao{s1}([1:div_point],:) ; populacao{s2}([div_point+1:tamanho_caminho+1],:)];

end

