function mapper_chunks(data, info, intermKVStore, n, samples)

% Mapper function for chunks

Y = data.Ym;

intermKey = 'SingleKey';
add(intermKVStore,intermKey,rand_compression_n_mode(Y, n, samples));



