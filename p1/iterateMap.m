
%Plot function
at=[0:0.01:7500];

n=1000;
b=29
at1=b*at.*exp(-at/n);

%Iterate the function
a(1)=1;
t=[1:1:200];
for i=t
    a(i+1)=b*a(i).*exp(-a(i)/n);
end


%Make a cobweb diagram
j=0;
for i=1:1:(length(a)-1)
    j=j+1;
    a2(j)=a(i);
    a3(j)=a(i);
    j=j+1;
    a2(j)=a(i);
    a3(j)=a(i+1);
end

%Plot cobweb diagram
figure(2)
prop=plot(at,at1,'k-',at,at,'k--',a2,a3,'r-')
set(prop,'LineWidth',1)
set(gca,'TickDir','out')
set(gca,'FontSize',26)
xlabel('Population at time t: a_t')
ylabel('Population at time t+1: a_{t+1}')
axis([0 7500 0 7500])

%Plot time series
figure(1)
prop=plot(t,a(1:max(t)),'r')
set(prop,'LineWidth',2)

set(gca,'TickDir','out')
set(gca,'FontSize',26)
xlabel('Time: t')
ylabel('Population : a_{t}')
axis([0 40 0 7500])

