clear

benchmark = 1;

NumWorkers = 4;

%% Default workers settings
poolobj = gcp('nocreate'); 
if isempty(poolobj)
    p = parpool('local',NumWorkers);
else
    p = poolobj;
end
mr = mapreducer(p);

outputFolder = '/tmp/out';

if (benchmark == 1)
    dataFolder = 'data/';
    ranks = [5 5 5 5]; % ranks of factorizations
    samples = 5;
end

% Parameters
Tol = 1e-5;
MaxIter = 100;
Show_inx = 1;
splitN = 2;
MC = 1;

% create ds
ds = datastore(dataFolder, 'ReadFcn', @load, 'FileExtensions', '.mat', 'Type', 'file');

%launch algoritm
elapsed_time = [];
for i=1:MC
    tic
    [Xtt] = dist_ttd_sr(ds, outputFolder, mr, splitN, samples, ranks);
    elapsed_time(i) = toc;
end
mean_elapsed_time = mean(elapsed_time)
std_elapsed_time = std(elapsed_time)


