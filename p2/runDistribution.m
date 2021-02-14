function sites = runDistribution(p,m,n,T)

sites=ones(1,n);

for t=1:T
    totallike = sum(sites);
    oldsites = sites;
%     for ii=1:length(sites)
%         sumsites(ii) = sum(sites(1:ii));
%     end
    
    for i=1:m
        if rand<p
            pick = randi(length(sites));
            sites(pick) = sites(pick) + 1;
        else
            pick = rand;
            sumlikes = 0;
            for j=1:length(sites)
                sumlikes = sumlikes+oldsites(j);
                if pick<(sumlikes/totallike)
                    sites(j) = sites(j) + 1;
                    break
                end
            end
        end
    end
    sites = [sites 1];
end

return