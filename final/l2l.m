function L = l2l(p, n)

q = 2;

for i=1:n
    for j=1:n
        x((i-1)*n+j) = j;
        y((i-1)*n+j) = i;
    end
end

network = createGridNetwork(n);
L_0 = averagePathLength(network);

% Rewire a random node.
for i = 1:n*n
    network = rewireNode( network, i, p, q, -1 );
end

L_p = averagePathLength(network);

L = L_p / L_0;

end


function [dd] = distance(x, n, u, d)
    [k, l] = ind2sub([n, n], x);
    [j, i] = ind2sub([n, n], u);
    dist = abs(l - i) + abs(k - j);
    dd = dist <= d
end


function [newNetwork] = rewireNode(network, u, p, q, d)

    [n, ~] = size(network);
    
    % No more than 4 connection per node.
    if q > 4
        q = 4;
    end
    
    % Get all connections of this row-node.
    cons = find( network(u, :) );

    % Get new random connections, but exclude existing ones.
    rcons = setdiff( randperm(n), cons );
    
    % Exclude all connections with distance bigger than d.
    if d > 0 
        rcons = rcons( distance(rcons, sqrt(n), u, d ) );
    end

    % Rewire selected number of connections.
    for qq = 1:q
        if rand < p
            % Pick a new connection and wire. 
            col = randi(numel(rcons));
            network( u, rcons( col ) ) = 1;

            % Unwire one of the old connections. 
            col = randi(numel(cons));
            network( u, cons( col ) ) = 0;
        end
    end
    
    newNetwork = network;
end


function [network] = createGridNetwork(n)

    % Create adjacent matrix.
    network = zeros(n*n, n*n);
    s = [n n];
    
    % Take care of leftmost and rightmost.
    for row = 1:n
        network( sub2ind(s, row, 1), sub2ind(s, row, 2)   ) = 1;
        network( sub2ind(s, row, n), sub2ind(s, row, n-1) ) = 1;
        
        if row > 1 && row < n
            network( sub2ind(s, row, 1), sub2ind(s, row-1, 1) ) = 1;
            network( sub2ind(s, row, 1), sub2ind(s, row+1, 1) ) = 1;
            
            network( sub2ind(s, row, n), sub2ind(s, row-1, n) ) = 1;
            network( sub2ind(s, row, n), sub2ind(s, row+1, n) ) = 1;
        end
    end
    
    % Take care of top and bottom.
    for col = 1:n
        network( sub2ind(s, 1, col), sub2ind(s, 2, col) ) = 1;
        network( sub2ind(s, n, col), sub2ind(s, n-1, col) ) = 1;
        
        if col > 1 && col < n
            network( sub2ind(s, 1, col), sub2ind(s, 1, col-1) ) = 1;
            network( sub2ind(s, 1, col), sub2ind(s, 1, col+1) ) = 1;
            
            network( sub2ind(s, n, col), sub2ind(s, n, col-1) ) = 1;
            network( sub2ind(s, n, col), sub2ind(s, n, col+1) ) = 1;
        end
    end
    
    % Take care of inner nodes.
    for row = 2:n-1
        for col = 2:n-1
            id = sub2ind(s, row, col);
            network( id, sub2ind(s, row-1, col)   ) = 1;
            network( id, sub2ind(s, row+1, col)   ) = 1;
            network( id, sub2ind(s, row,   col-1) ) = 1;
            network( id, sub2ind(s, row,   col+1) ) = 1;
        end
    end

end

