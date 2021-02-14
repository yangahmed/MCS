function p = Polarisation(e,J)

J; %Number of timestep t0 be used


N=40; %Number of particles

e; %e is eta the noise parameter, whose maximum value is 2*pi

r=1;

%The radius of influence of a particle

L=20; %L is the size of the domain on which the particles can move

v=0.5; %v is the speed at which the particles move

% x(i,j) gives the x coordinate of the ith particle at time j
x=zeros(N,J+1);
x(:,1)=L*rand(N,1); %define initial x coordiantes of all particles
     
% y(i,j) gives the y coordinate of the ith particle at time j
y=zeros(N,J+1);
y(:,1)=L*rand(N,1); %define initial y coordiantes of all particles

% T(i,j) gives the angle with the x axis of the direction of motion of the ith
% particle at time j
T=zeros(N,J+1);
T(:,1)=2*pi*rand(N,1); %define initial direction of all particles

p=zeros(1,J);

%For all time steps
for j=1:J
    %For each particle
    for i=1:N
            %finds how many particles are in the interaction radius of each
            %particle
            A(:,1)=((x(i,j)-x(:,j)).^2+(y(i,j)-y(:,j)).^2).^0.5<=r;
            A(:,2)=((x(i,j)-x(:,j)-L).^2+(y(i,j)-y(:,j)).^2).^0.5<=r;
            A(:,3)=((x(i,j)-x(:,j)).^2+(y(i,j)-y(:,j)-L).^2).^0.5<=r;
            A(:,4)=((x(i,j)-x(:,j)+L).^2+(y(i,j)-y(:,j)).^2).^0.5<=r;
            A(:,5)=((x(i,j)-x(:,j)).^2+(y(i,j)-y(:,j)+L).^2).^0.5<=r;
            A(:,6)=((x(i,j)-x(:,j)+L).^2+(y(i,j)-y(:,j)+L).^2).^0.5<=r;
            A(:,7)=((x(i,j)-x(:,j)+L).^2+(y(i,j)-y(:,j)-L).^2).^0.5<=r;
            A(:,8)=((x(i,j)-x(:,j)-L).^2+(y(i,j)-y(:,j)+L).^2).^0.5<=r;
            A(:,9)=((x(i,j)-x(:,j)-L).^2+(y(i,j)-y(:,j)-L).^2).^0.5<=r;
        
            B=sum(A')';         
            ss=sum(sin(T(:,j)).*B)/sum(B);
            sc=sum(cos(T(:,j)).*B)/sum(B);
            S=atan2(ss,sc);
                   
            T(i,j+1)=S+e*(rand-0.5); %adds noise to the measured angle

            x(i,j+1)=x(i,j)+v*cos(T(i,j+1)); %updates the particles' x-coordinates
            y(i,j+1)=y(i,j)+v*sin(T(i,j+1)); %updates the particles' y coordinates

            % Jumps from the right of the box to the left or vice versa
            x(i,j+1)=mod(x(i,j+1),L);

            %Jumps from the top of the box to the bottom or vice versa
            y(i,j+1)=mod(y(i,j+1),L);
            
    end
    
    p(j) = (sum(sin(T(:,j)))^2 + sum(cos(T(:,j)))^2)^0.5;
 
end

p = p/N;

return