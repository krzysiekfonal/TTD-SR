function Xtt = dist_ttd_sr(ds, outputFolder, mr, split, samples, ranks)

% MR functions
mapper = @(data,info,intermKVStore) mapper_chunks(data,info,intermKVStore,split, samples);
reducer = @(intermKey,intermValIter,outKVStore) reducer_chunks(intermKey,intermValIter,outKVStore,split);

% Reduce tensor with rand projection in dist way
out = mapreduce(ds,mapper,reducer,mr,'Display', 'on','OutputFolder',outputFolder); % single key
out_read = readall(out);
Y = out_read.Value{1};

% calculate decomposition
Xtt = tt_decomposition(Y, split, ranks, 'left_svd_qr');

end

