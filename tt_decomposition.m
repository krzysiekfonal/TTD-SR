function [ Xtt ] = tt_decomposition( X, split, ranks, alg, varargin )
    dim = size(X);
    N = ndims(X);
    r_left = 1;
    Xtt = cell(N,1);
    M = reshape(double(X),dim(1),prod(dim(2:end)));
    
    for n = 1:split-1
        r_right = ranks(n);
        [A,B] = lrmf(M, alg, r_right, varargin);
        Xtt{n} = reshape(A,[r_left dim(n) r_right]);
        M = reshape(B, r_right * dim(n+1), prod(dim(n+2:end)));
        r_left = r_right;
    end
    Xtt{1} = squeeze(Xtt{1});
    
    r_right = 1;
    M = reshape(M, prod([ranks(split-1) dim(split) dim(split+1:N-1)]), dim(N))';
    for n = N:-1:split+1
        r_left = ranks(n-1);
        [A,B] = lrmf(M, alg, r_left, varargin);
        Xtt{n} = reshape(A',[r_left dim(n) r_right]);
        if n-1 == split
            tmp = 1;
        else
            tmp = dim(n-1);
        end
        M = reshape(B,...
            prod([ranks(split-1) dim(split) dim(split+1:n-2)]),...
            prod([r_left tmp]));
        r_right = r_left;
    end
    
    Xtt{split} = reshape(M, [ranks(split-1) dim(split) r_left]);
    
end

