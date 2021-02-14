function e=ent(data)

dmin=min(data);
dmax=max(data);
hrange=[dmin:1:dmax];
histd=hist(data,hrange);
num=sum(histd);
p=histd/num;

e=0;
for i=[1:length(p)]
    if p(i)==0
        e = e;
    else
        e = e - p(i)*log2(p(i));
    end
end

return