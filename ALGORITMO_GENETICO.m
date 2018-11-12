%coordenadas da posicao inicial do robo
x_inicial = 4;
y_inicial = 4;
%coordenadas da posicao final desejada do robo
x_final = -4;
y_final = -4;

%numero de individuos da populacao de caminhos
tamanho_populacao = 100;

%quantidade de retas que havera nos individuos
tamanho_caminho = 10;

%survive rate for next generation
sobrevivem = 40;

%Number of generations
geracoes = 100;

%Mutation chance for each node
mutacao = 0.0005; %For each point in the path

%cria a populacao
populacao = generate_population(x_inicial,y_inicial,tamanho_populacao,tamanho_caminho);

%Adquire o fitness da populacao
fitness = get_fitness(x_final,y_final,tamanho_populacao,tamanho_caminho,populacao);

%organiza por fitness, selecionando assim os elitistas
[out,id_ranking]=sort(fitness);

%inicia criacao da proxima geracao
proxima_geracao = populacao;

%Repete pela quantidade de geracoes
for i = 1:geracoes
    
    %Selecao dos elitistas da geracao anterior para a proxima geracao
    for j = 1:sobrevivem
        proxima_geracao{j} = populacao{id_ranking(j)}; 
    end
    
    %Cross-over da populacao anterior para geracao dos novos individuos
    for j = (sobrevivem+1):tamanho_populacao
        proxima_geracao{j} = cross_over(populacao,fitness,tamanho_caminho);
    end
    
    %adquire o fitness da nova populacao gerada
    fitness = get_fitness(x_final,y_final,tamanho_populacao,tamanho_caminho,proxima_geracao);
    
    %cout de uma media da fitness da populacao atual
    mean(fitness)
    
    %organiza por fitness, assim selecionando os elitistas
    [out,id_ranking]=sort(fitness);
    
    %salva a nova geracao criada como a atual populacao
    populacao = proxima_geracao;
end

%salva em um arquivo .mat os dados da ultima geracao criada
save('last_generation','population','fitness');

