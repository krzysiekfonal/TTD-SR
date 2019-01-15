function [ X ] = tt_to_tensor( Xtt )
%TT_TO_TENSOR Summary of this function goes here
%   Detailed explanation goes here
left = 2;
right = 1;
N = size(Xtt,1);

X = Xtt{1};
for n=2:N
    X = tensor_contraction(X, Xtt{n}, left, right);
    left = left + 1;
end

end

