function reducer_chunks(intermKey, intermValIter, outKVStore, n)
% Reducer function for the NMFMapReduce.

Y = getnext(intermValIter);

while (intermValIter.hasnext)
    Ym = getnext(intermValIter);
    Y = cat(n, Y, Ym);
end

outKVStore.add(intermKey,Y);

