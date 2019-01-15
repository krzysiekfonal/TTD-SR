function [ core ] = tt_projection2( X, Xtt, ranks, split )
    dim = size(X);
    N = ndims(X);
    r_left = 1;
    
    M = reshape(double(X),dim(1),prod(dim(2:end)));
    for n = 1:split-1
        r_right = ranks(n);
        Q = reshape(Xtt{n}, r_left*dim(n), r_right);
        M = reshape(Q'*M, r_right * dim(n+1), prod(dim(n+2:end)));
        r_left = r_right;
    end
    
    r_right = 1;
    M = reshape(M, prod([ranks(split-1) dim(split) dim(split+1:N-1)]), dim(N));
    for n = N:-1:split+1
        r_left = ranks(n-1);
        Q = reshape(Xtt{n}, r_left, dim(n)*r_right);
        if n-1 == split
            tmp = 1;
        else
            tmp = dim(n-1);
        end
        M = reshape(M*Q',...
            prod([ranks(split-1) dim(split) dim(split+1:n-2)]),...
            prod([r_left tmp]));
        r_right = r_left;
    end
    
    core = reshape(M, [ranks(split-1) dim(split) r_left]);
    
end

