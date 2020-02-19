num_size_mat = 4; num_rand = 100;
% num_size_mat means the number of different size of matrix
% we want to compute, and num_rand means the times of random
% matrices we want to take for one specific size of matrix.
rho_mean = zeros(num_size_mat,1); % mean spectral radius
for power = 3 : (3 + num_size_mat - 1)
    figure;
    rho_vals = zeros(num_rand,1);
    m = 2^power; % size of matrix
    eig_vals = zeros(num_rand,m);
    for i = 1:num_rand
        A = randn(m,m) / sqrt(m);
        lambda = eig(A);
        eig_vals(i,:) = lambda';
        plot([1:m], abs(eig_vals(i,:)), '.');
        rho_vals(i) = max(abs(eig_vals(i,:)));
        hold on;
    end
    rho_mean(power - 2) = mean(rho_vals);
end
figure;
length(rho_mean)
plot(2 .^ [3:(3+ num_size_mat -1)], rho_mean, 'r-')
