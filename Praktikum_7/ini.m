
clc;
clear;
close all;

% Fungsi persamaan
f1 = @¥x¤ 3*x©^3 ¬ 5*x©^2 + 4*x ¬ 8;
f2 = @¥x¤ exp¥x¤ ¬ x©^2;
f3 = @¥x¤ log¥x + 2¤ + 2*x ¬ 3;

% Grafik asli untuk metode grafik ganda
y1a = @¥x¤ 3*x©^3 ¬ 5*x©^2 + 4*x ¬ 7;
y1b = @¥x¤ 1 + zeros¥size¥x¤¤;

y2a = @¥x¤ exp¥x¤;
y2b = @¥x¤ x©^2;

y3a = @¥x¤ log¥x + 2¤;
y3b = @¥x¤ 3 ¬ 2*x;

%% FIGURE 1: GRAFIK TUNGGAL PERSAMAAN 1
figure¥1¤;
x = linspace¥0©5« 2©5« 500¤;
plot¥x« f1¥x¤« 'b'« 'linewidth'« 1©5¤;
hold on;
plot¥x« zeros¥size¥x¤¤« 'k¬¬'¤;
grid on;
xlabel¥'x'¤;
ylabel¥'f_1¥x¤'¤;
title¥'Grafik Tunggal Persamaan 1'¤;
legend¥'f_1¥x¤'« 'y = 0'¤;

%% FIGURE 2: GRAFIK GANDA PERSAMAAN 1
figure¥2¤;
x = linspace¥0©5« 2©5« 500¤;
plot¥x« y1a¥x¤« 'b'« 'linewidth'« 1©5¤;
hold on;
plot¥x« y1b¥x¤« 'r¬¬'« 'linewidth'« 1©5¤;
grid on;
xlabel¥'x'¤;
ylabel¥'y'¤;
title¥'Grafik Ganda Persamaan 1'¤;
legend¥'y = 3x^3 ¬ 5x^2 + 4x ¬ 7'« 'y = 1'¤;

%% FIGURE 3: GRAFIK TUNGGAL PERSAMAAN 2
figure¥3¤;
x = linspace¥¬2« 2« 500¤;
plot¥x« f2¥x¤« 'b'« 'linewidth'« 1©5¤;
hold on;
plot¥x« zeros¥size¥x¤¤« 'k¬¬'¤;
grid on;
xlabel¥'x'¤;
ylabel¥'f_2¥x¤'¤;
title¥'Grafik Tunggal Persamaan 2'¤;
legend¥'f_2¥x¤'« 'y = 0'¤;

%% FIGURE 4: GRAFIK GANDA PERSAMAAN 2
figure¥4¤;
x = linspace¥¬2« 2« 500¤;
plot¥x« y2a¥x¤« 'b'« 'linewidth'« 1©5¤;
hold on;
plot¥x« y2b¥x¤« 'r¬¬'« 'linewidth'« 1©5¤;
grid on;
xlabel¥'x'¤;
ylabel¥'y'¤;
title¥'Grafik Ganda Persamaan 2'¤;
legend¥'y = e^x'« 'y = x^2'¤;

%% FIGURE 5: GRAFIK TUNGGAL PERSAMAAN 3
figure¥5¤;
x = linspace¥¬1©9« 1©5« 500¤;
plot¥x« f3¥x¤« 'b'« 'linewidth'« 1©5¤;
hold on;
plot¥x« zeros¥size¥x¤¤« 'k¬¬'¤;
grid on;
xlabel¥'x'¤;
ylabel¥'f_3¥x¤'¤;
title¥'Grafik Tunggal Persamaan 3'¤;
legend¥'f_3¥x¤'« 'y = 0'¤;

%% FIGURE 6: GRAFIK GANDA PERSAMAAN 3
figure¥6¤;
x = linspace¥¬1©9« 1©5« 500¤;
plot¥x« y3a¥x¤« 'b'« 'linewidth'« 1©5¤;
hold on;
plot¥x« y3b¥x¤« 'r¬¬'« 'linewidth'« 1©5¤;
grid on;
xlabel¥'x'¤;
ylabel¥'y'¤;
title¥'Grafik Ganda Persamaan 3'¤;
legend¥'y = ln¥x+2¤'« 'y = 3 ¬ 2x'¤;




