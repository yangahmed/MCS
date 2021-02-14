function [x,R,S,B] = runRSB3(p,q,r,N,T)
   
%Initial conditions
x=zeros(N,N,T);
%x(:,:,1)=randi([0,2],N,N);
R=zeros(T,1);
S=zeros(T,1);
B=zeros(T,1);
%Initially one infected individual
%R(1)=N-2;
%S(1)=1;
%B(1)=1;

x(randi(N),randi(N),1)=1;
x(randi(N),randi(N),1)=2;


for t=1:T-1
    x(:,:,t+1)=x(:,:,t);
    
    %For each cell
    for i=0:N-1
        icells=[mod(i-1,N) mod(i-1,N) mod(i-1,N) i i mod(i+1,N) mod(i+1,N) mod(i+1,N)]+1;
        for j=0:N-1
            %Find your neighbours
            jcells=[mod(j-1,N) j mod(j+1,N) mod(j-1,N) mod(j+1,N) mod(j-1,N) j mod(j+1,N)]+1;
            
            if (x(i+1,j+1,t)==0)
                R(t)=R(t)+1;
                if (rand<p)
                    x(i+1,j+1,t+1)=1;
                end
            end
            
            if (x(i+1,j+1,t)==1)
                S(t)=S(t)+1;
                if (rand<q)
                    pick=randi(8);
                    ii=icells(pick);
                    jj=jcells(pick);
                    if(x(ii,jj,t)==0)
                         x(ii,jj,t+1)=1;
                    else
                        if(x(ii,jj,t)==2)
                            x(i+1,j+1,t+1)=2;
                        end
                    end
                end
            end

            if (x(i+1,j+1,t)==2)
                B(t)=B(t)+1;
                if (rand<r)
                    pick=randi(4);
                    ii=icells(pick);
                    jj=jcells(pick);
                    if(x(ii,jj,t)==0)
                         x(i+1,j+1,t+1)=0;
                    end
                end
            end
            
        end
    end
    
end

return