function [S,I,R] = runSIR(r,N,T)
   
%Initial conditions
S=zeros(T,1);
I=zeros(T,1);
R=zeros(T,1);
%Initially one infected individual
I(1)=1;
R(1)=0;
S(1)=N-1;

for t=1:T-1
    
    %First set up what happens if there is no change.
    S(t+1)=S(t);
    R(t+1)=R(t);
    I(t+1)=I(t);
    
    %Each infected individual contacts one other individual at random
    for i=1:I(t)
        if (rand<S(t+1)/N)
            %Contact an susceptible individual
            S(t+1)=S(t+1)-1;
            I(t+1)=I(t+1)+1;
        end
        if (rand<r)
            %Individual recovers
            %We allow spread and recovery on the same time step.
            R(t+1)=R(t+1)+1;
            I(t+1)=I(t+1)-1;
        end
    end
end

return
             
             
             