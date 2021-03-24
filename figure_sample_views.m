
figure(3)
subplot(2,2,1)
plot_sample;
view(120,30);

subplot(2,2,2)
plot_sample;
view(0,90);

subplot(2,2,3)
plot_sample;
view(90,0);

subplot(2,2,4)
plot_sample;
view(0,0);

set(figure(3), 'position', [800 100 600 500])
