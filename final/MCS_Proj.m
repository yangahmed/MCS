n = 1000;
k = 4;
network = zeros(n,n);
p=0.8;

r = 0.5;
deadOrImmune = zeros(n,1);

for i=1:n
    for j=1:k
        if i+j ~= n
            network(i,mod(i+j,n)) = 1;
            network(mod(i+j,n),i) = 1;
        else
            network(i,i+j) = 1;
            network(i+j,i) = 1;
        end
    end
end

G = graph(network);
plot(G);

for i=1:n
    for j=1:k
        prob = rand;
        if prob < p
            x = randi(n);
            if i~=x && network(i,x) ~= 1
                if i+j ~= n
                    network(i,mod(i+j,n)) = 0;
                    network(mod(i+j,n),i) = 0;
                else
                    network(i,i+j) = 0;
                    network(i+j,i) = 0;
                end           
                network(i,x) = 1;
                network(x,i) = 1;
            end
        end
    end
end

figure;
G = graph(network);
plot(G);

C = clustCoeff(network);
L = averagePathLength(network);

infected = zeros(n,1);
firstInfected = randi(n);
infected(1,1) = firstInfected;
deadOrImmune(firstInfected) = 1;

row = network(firstInfected,:);
neighbours = find(row);

infectedCount = 1;
timesteps = 0;

while nnz(infected) < (n/2)
    for x = 1:nnz(infected)
        row = network(infected(x),:);
        neighbours = find(row);
    
        for index=1:numel(neighbours)
            probInfection = rand;
            if probInfection < r
                if deadOrImmune(neighbours(index),1) == 0
                    infected(infectedCount+1,1) = neighbours(index);
                    deadOrImmune(neighbours(index),1) = 1;
                    infectedCount = infectedCount + 1;
                end
            end  
        end
    end
    timesteps = timesteps + 1;
end

timesteps