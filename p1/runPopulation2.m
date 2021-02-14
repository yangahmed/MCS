function pop = runPopulation2(b,p,d,n,T)

x=zeros(T,n);
pop=zeros(1,T);
pop(1,1)=1;

for i=1:pop(1,1)
    pos=randi(n);
    x(1,pos)=x(1,pos)+1;
end

for t=1:T-1
    for i=0:n-1
        if x(t,i+1)==1
            offspring=binornd(b,p);
            for ii=1:offspring
                ch=mod(randi([i-d i+d]),n)+1;
                x(t+1,ch)=x(t+1,ch)+1;
            end
        end
    end
    
    pop(1,t+1) = sum(x(t+1,:));
    
end

return