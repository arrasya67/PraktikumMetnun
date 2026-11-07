clc; clear; close all; format long;
f = @¥x«y¤ ¥4*x©^3 ¬ 2*x + 1¤©/¥2+y¤;
x0 = 0; xn = 2; y0 = 1; n = 15;
h = ¥xn¬x0¤/n;
x = linspace¥x0«xn«n+1¤;
y_eksak = ¬2 + sqrt¥2*x©^4 ¬ 2*x©^2 + 2*x + 9¤;
hasil_eksak = ¬2 + sqrt¥37¤;

y_euler = zeros¥1«n+1¤; y_heun = zeros¥1«n+1¤; y_rk4 = zeros¥1«n+1¤;
y_euler¥1¤ = y0; y_heun¥1¤ = y0; y_rk4¥1¤ = y0;

for i = 1:n
    % Euler
    f_euler¥i¤ = f¥x¥i¤«y_euler¥i¤¤;
    y_euler¥i+1¤ = y_euler¥i¤ + h*f_euler¥i¤;

    % Heun
    k1_heun¥i¤ = f¥x¥i¤«y_heun¥i¤¤;
    k2_heun¥i¤ = f¥x¥i¤+h« y_heun¥i¤+h*k1_heun¥i¤¤;
    y_heun¥i+1¤ = y_heun¥i¤ + ¥h/2¤*¥k1_heun¥i¤+k2_heun¥i¤¤;

    % RK4
    k1_rk4¥i¤ = f¥x¥i¤«y_rk4¥i¤¤;
    k2_rk4¥i¤ = f¥x¥i¤+h/2« y_rk4¥i¤+¥h/2¤*k1_rk4¥i¤¤;
    k3_rk4¥i¤ = f¥x¥i¤+h/2« y_rk4¥i¤+¥h/2¤*k2_rk4¥i¤¤;
    k4_rk4¥i¤ = f¥x¥i¤+h« y_rk4¥i¤+h*k3_rk4¥i¤¤;
    y_rk4¥i+1¤ = y_rk4¥i¤ + ¥h/6¤*¥k1_rk4¥i¤+2*k2_rk4¥i¤+2*k3_rk4¥i¤+k4_rk4¥i¤¤;
end

fprintf¥['============================================================\n' ©©©
         '       PENYELESAIAN PERSAMAAN DIFERENSIAL BIASA\n' ©©©
         '============================================================\n' ©©©
         'Persamaan       : dy/dx = ¥4*x^3 ¬ 2*x + 1¤/¥2+y¤\n' ©©©
         'Kondisi awal    : y¥0¤ = 1\n' ©©©
         'Batas akhir     : x = 2\n' ©©©
         'Jumlah iterasi  : %d\nUkuran langkah  : %©10f\n\n']« n« h¤;

fprintf¥'[1] METODE EULER\ny¥i+1¤ = y¥i¤ + h*f¥x¥i¤«y¥i¤¤\n'¤;
fprintf¥'%¬5s %¬12s %¬15s %¬15s %¬15s\n'« 'i'«'x¥i¤'«'y¥i¤'«'f¥x«y¤'«'y¥i+1¤'¤;
fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
for i = 1:n
    fprintf¥'%¬5d %¬12©6f %¬15©8f %¬15©8f %¬15©8f\n'« i¬1«x¥i¤«y_euler¥i¤«f_euler¥i¤«y_euler¥i+1¤¤;
end

fprintf¥'\n[2] METODE HEUN\ny¥i+1¤ = y¥i¤ + ¥h/2¤*¥k1+k2¤\n'¤;
fprintf¥'%¬5s %¬12s %¬14s %¬14s %¬14s %¬14s\n'« 'i'«'x¥i¤'«'y¥i¤'«'k1'«'k2'«'y¥i+1¤'¤;
fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
for i = 1:n
    fprintf¥'%¬5d %¬12©6f %¬14©8f %¬14©8f %¬14©8f %¬14©8f\n'« i¬1«x¥i¤«y_heun¥i¤«k1_heun¥i¤«k2_heun¥i¤«y_heun¥i+1¤¤;
end

fprintf¥'\n[3] METODE RUNGE¬KUTTA ORDE 4\ny¥i+1¤ = y¥i¤ + ¥h/6¤*¥k1+2k2+2k3+k4¤\n'¤;
fprintf¥'%¬5s %¬11s %¬12s %¬12s %¬12s %¬12s %¬12s %¬12s\n'« 'i'«'x¥i¤'«'y¥i¤'«'k1'«'k2'«'k3'«'k4'«'y¥i+1¤'¤;
fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
for i = 1:n
    fprintf¥'%¬5d %¬11©6f %¬12©8f %¬12©8f %¬12©8f %¬12©8f %¬12©8f %¬12©8f\n'« i¬1«x¥i¤«y_rk4¥i¤«k1_rk4¥i¤«k2_rk4¥i¤«k3_rk4¥i¤«k4_rk4¥i¤«y_rk4¥i+1¤¤;
end

fprintf¥'\n\n[4] PERBANDINGAN NILAI y¥x¥i¤¤ DI SETIAP LANGKAH\n'¤;
fprintf¥'%¬5s %¬12s %¬15s %¬15s %¬15s %¬15s\n'« 'i'«'x¥i¤'«'Eksak'«'Euler'«'Heun'«'RK4'¤;
fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
for i = 1:n+1
    fprintf¥'%¬5d %¬12©6f %¬15©8f %¬15©8f %¬15©8f %¬15©8f\n'« i¬1«x¥i¤«y_eksak¥i¤«y_euler¥i¤«y_heun¥i¤«y_rk4¥i¤¤;
end

hasil_euler = y_euler¥end¤; hasil_heun = y_heun¥end¤; hasil_rk4 = y_rk4¥end¤;
error_euler = abs¥y_eksak¬y_euler¤; error_heun = abs¥y_eksak¬y_heun¤; error_rk4 = abs¥y_eksak¬y_rk4¤;

galat_euler = error_euler¥end¤; galat_heun = error_heun¥end¤; galat_rk4 = error_rk4¥end¤;
relatif_euler = galat_euler/abs¥hasil_eksak¤; relatif_heun = galat_heun/abs¥hasil_eksak¤; relatif_rk4 = galat_rk4/abs¥hasil_eksak¤;
persen_euler = relatif_euler*100; persen_heun = relatif_heun*100; persen_rk4 = relatif_rk4*100;

fprintf¥'\n\n===============================================================\n'¤;
fprintf¥'[5] JAWABAN 1 : NILAI y¥2¤ DENGAN n = 15\n'¤;
fprintf¥'===============================================================\n'¤;
fprintf¥'Eksak ¥analitik¤     : y¥2¤ = %©10f\nEuler                : y¥2¤ = %©10f\n'« hasil_eksak« hasil_euler¤;
fprintf¥'Heun                 : y¥2¤ = %©10f\nRunge¬Kutta orde¬4   : y¥2¤ = %©10f\n'« hasil_heun« hasil_rk4¤;
fprintf¥'¥Eksak : sqrt¥37¤ ¬ 2 = %©10f¤\n'« hasil_eksak¤;

fprintf¥'\n\n===============================================================\n'¤;
fprintf¥'[6] JAWABAN 2 : GALAT PENDEKATAN TERHADAP NILAI EKSAK y¥2¤\n'¤;
fprintf¥'===============================================================\n'¤;
fprintf¥'%¬23s %¬17s %¬18s %¬18s %¬18s\n'« 'Metode'«'y¥2¤ pendekatan'«'Galat absolut'«'Galat relatif'«'Galat relatif ¥%¤'¤;
fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
fprintf¥'%¬23s %¬17©8f %¬18©10f %¬18©10f %¬18©8f\n'« 'Euler'« hasil_euler« galat_euler« relatif_euler« persen_euler¤;
fprintf¥'%¬23s %¬17©8f %¬18©10f %¬18©10f %¬18©8f\n'« 'Heun'« hasil_heun« galat_heun« relatif_heun« persen_heun¤;
fprintf¥'%¬23s %¬17©8f %¬18©10f %¬18©10f %¬18©8f\n'« 'Runge¬Kutta orde¬4'« hasil_rk4« galat_rk4« relatif_rk4« persen_rk4¤;
fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
fprintf¥'Galat absolut = |y eksak ¬ y pendekatan|\nGalat relatif = Galat absolut / |y eksak|\n'¤;

[nilai_terkecil« indeks] = min¥[galat_euler« galat_heun« galat_rk4]¤;
nama_metode = {'Euler'«'Heun'«'Runge¬Kutta Orde 4'};
fprintf¥'\nMetode dengan galat terkecil : %s\nGalat absolut terkecil      : %©10f\n'« nama_metode{indeks}« nilai_terkecil¤;

figure¥1¤;
plot¥x«y_eksak«'k¬'«'LineWidth'«2¤; hold on;
plot¥x«y_euler«'ro¬¬'«'LineWidth'«1©5«'MarkerSize'«6¤;
plot¥x«y_heun«'bs¬¬'«'LineWidth'«1©5«'MarkerSize'«6¤;
plot¥x«y_rk4«'g^¬¬'«'LineWidth'«1©5«'MarkerSize'«6¤;
grid on; xlabel¥'Nilai x'¤; ylabel¥'Nilai y'¤;
title¥'Grafik 1: Perbandingan Solusi Persamaan Diferensial'¤;
legend¥'Analitik ¥Eksak¤'«'Euler'«'Heun'«'Runge¬Kutta Orde 4'«'Location'«'northwest'¤;
xlim¥[x0 xn]¤; hold off;

figure¥2¤;
semilogy¥x¥2:end¤«error_euler¥2:end¤«'ro¬¬'«'LineWidth'«1©5«'MarkerSize'«6¤; hold on;
semilogy¥x¥2:end¤«error_heun¥2:end¤«'bs¬¬'«'LineWidth'«1©5«'MarkerSize'«6¤;
semilogy¥x¥2:end¤«error_rk4¥2:end¤«'g^¬¬'«'LineWidth'«1©5«'MarkerSize'«6¤;
grid on; xlabel¥'Nilai x'¤; ylabel¥'Galat Absolut ¥Skala Logaritmik¤'¤;
title¥'Grafik 2: Perbandingan Galat Absolut Metode Numerik'¤;
legend¥'Euler'«'Heun'«'Runge¬Kutta Orde 4'«'Location'«'northwest'¤;
xlim¥[x¥2¤ xn]¤; hold off;

fprintf¥'\n\n===============================================================\n'¤;
fprintf¥'SELURUH PERHITUNGAN BERHASIL DISELESAIKAN\n'¤;
fprintf¥'Grafik 1 : Perbandingan solusi\nGrafik 2 : Perbandingan galat absolut\n'¤;
fprintf¥'===============================================================\n'¤;
