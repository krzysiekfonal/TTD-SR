function generate_rand_tensor( dimY, N, data_dir )

for i = 1:N
    Ym = rand(dimY);
    save(strcat(data_dir, num2str(i, '%04d'), '.mat'), 'Ym');
end

end

