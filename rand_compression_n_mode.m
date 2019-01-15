function [Z] = rand_compression_n_mode(X, n, samples)
    Omega = rand(size(X,n), samples);
    Z = ntimes(Omega,X,1,n);
    dims = 1:ndims(X);
    
    if n~=1
        Z = permute(Z, [dims(2:n) 1 dims(n+1:end)]);
    end
end




