function ca

clc;
clear;
N = 50;
nsteps = 11116;
A = zeros(N);
i = N/2;
j = N/2;
d = 'e';

symbol = [1 0 0 1 1 0 0 1];
n = length(symbol);


for t = 1 : nsteps
    k = A(i, j);
    k = k + 1;
    A(i, j) = k;
    if A(i, j) == n
        A(i, j) = 0;
    end
    if symbol(k) == 1
        if d == 'n'
            j = j + 1;
            d = 'e';
        elseif d == 'e'
            i = i + 1;
            d = 's';
        elseif d == 's'
            j = j - 1;
            d = 'w';
        elseif d == 'w'
            i = i - 1;
            d = 'n';
        end
    elseif symbol(k) == 0
        if d == 'n'
            j = j - 1;
            d = 'w';
        elseif d == 'e'
            i = i - 1;
            d = 'n';
        elseif d == 's'
            j = j + 1;
            d = 'e';
        elseif d == 'w'
            i = i + 1;
            d = 's';
        end
    end
end
    imagesc(A);
    colormap default
    axis equal
