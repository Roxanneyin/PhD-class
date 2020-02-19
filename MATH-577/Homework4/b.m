j = 1;
clf;
allNorms = [];
allSpecs = [];
idx = 3:6;
for j = idx
    gnorm = [];
    gspec = [];
    for i = 1:100
        m = 2^j;
        A = randn(m,m) / sqrt(m);
        gnorm = [gnorm norm(A)];
        gspec = [gspec max(abs(eig(A)))];
        hold on;
    end
    
    allNorms = [allNorms mean(gnorm)];
    allSpecs = [allSpecs mean(gspec)];
end

plot(idx, allNorms, 'r:');
plot(idx, allSpecs, 'b--');
plot(idx, allNorms-allSpecs, 'k-');
legend('gnorm', 'gspec', 'diff');