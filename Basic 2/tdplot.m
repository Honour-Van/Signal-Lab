plot(st);
hold on; grid;
plot(rt1);
plot(sr);
axis([0, 500, -0.7, 0.7])
legend('Raw', 'Filtered', 'Recon');