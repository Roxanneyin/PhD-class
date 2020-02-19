j = 1;
clf;
allSV = [];
idx = 3:6;
for j = idx
    gSV = [];
    for i = 1:100
        m = 2^j;
        A = randn(m,m) / sqrt(m);
        gSV = [gSV min(svd(A))];
        hold on;
    end
    sv_total = length(gSV);
    t = []; y = [];
    for k = idx
        t = [t 2^(9 - k) ^(-1)];
        y = [y sum(sum(gSV < t(k - 2)))];
    end
    plot(t, y, 'b--');
    legend('proportion of min sv < x')
    allSV = [allSV mean(gSV)];
    figure;
end
plot(idx, allSV, 'r:');
legend('mean min sv');