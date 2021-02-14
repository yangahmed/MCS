function u = runvoter(p,N,T)
   
%Initial conditions
u=zeros(T,1);
u(1)=N/2;

for t=1:T-1
    u(t+1)=u(t);
    for i=1:u(t)
         if (rand<p)
             %Individuals who switch randomly
             u(t+1)=u(t+1)-1;
         else
            %Look at two other randomly chosen individuals
            %If neither are u then change
            u(t+1)=u(t+1)-(rand<(N-u(t))/N)*(rand<(N-u(t))/N);
         end
    end
    for i=u(t)+1:N
         if (rand<p)
             %Individuals who switch randomly
             u(t+1)=u(t+1)+1;
         else
            %Look at two other randomly chosen individuals
            %If neither are u then change
            u(t+1)=u(t+1)+(rand<u(t)/N)*(rand<u(t)/N);
         end
    end
end
