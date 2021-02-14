function pop = runPopulation(b,p,n,T,N)

x=zeros(T,n);
pop=zeros(1,T);
pop(1,1)=N;

for t=1:T-1
    for i=1:pop(1,t)
        pos=randi(n);
        x(t,pos)=x(t,pos)+1;
    end
    
    for i=1:n
        if x(t,i)==1
            pop(t+1)=pop(t+1) + binornd(b,p);
        end
    end
    
end

return