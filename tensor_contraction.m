function [ C ] = tensor_contraction( A,B,i,j )
    dimA = size(A);
    dimB = size(B);
    N_A = ndims(A);
    N_B = ndims(B);
    A_ = reshape(permute(A, [[1:i-1 i+1:N_A] i]), ...
        prod(dimA) / dimA(i), dimA(i));
    B_ = reshape(permute(B, [j [1:j-1 j+1:N_B]]), ...
        dimB(j), prod(dimB) / dimB(j));
    
    C = reshape(A_ * B_, [dimA([1:i-1,i+1:N_A]) dimB([1:j-1,j+1:N_B])]);
end

