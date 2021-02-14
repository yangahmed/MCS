function sites = runDistribution2(p,m,n,T)

sites = sparse(n+T, n+T);

% for i=1:n
%     sites(i,i) = 1;
% end

for t=1:T
    totallike = sum(sites);
    
    for i=1:m
        if rand<p
            pick = randi(n+t);
            sites(n+t,pick) = 1;
%             sites(pick,n+t) = 1;
        else
            pick = rand;
            sumlikes = 0;
            for j=1:n+t
                sumlikes = sumlikes + totallike(j);
                if pick<(sumlikes/sum(totallike))
                    sites(n+t,j) = 1;
%                     sites(j,n+t) = 1;
                    break
                end
            end
        end
    end
end

return