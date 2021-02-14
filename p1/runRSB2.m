function [R,S,B] = runRSB2(p,q,r,N,T)
   
%Initial conditions
R=zeros(T,1);
S=zeros(T,1);
B=zeros(T,1);
%Initially one infected individual
R(1)=N-2;
S(1)=1;
B(1)=1;

for t=1:T-1
    
    %First set up what happens if there is no change.
    R(t+1)=R(t);
    S(t+1)=S(t);
    B(t+1)=B(t);
    
    %Each infected individual contacts one other individual at random
    for i=1:R(t)
        if (rand<p)
            %Contact an susceptible individual
            R(t+1)=R(t+1)-1;
            S(t+1)=S(t+1)+1;
        end
    end
    
    for i=1:S(t)
        if (rand<q)
            pick=rand;
            if(pick<R(t+1)/N)
                R(t+1)=R(t+1)-1;
                S(t+1)=S(t+1)+1;
            else
                if(pick<R(t+1)/N+B(t+1)/N)
                    S(t+1)=S(t+1)-1;
                    B(t+1)=B(t+1)+1;
                end
            end
        end
    end
    
    for i=1:B(t)
        if (rand<r)
            if(rand<R(t+1)/N)
                R(t+1)=R(t+1)+1;
                B(t+1)=B(t+1)-1;
            end
        end
    end
    
end

return