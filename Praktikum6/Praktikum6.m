
clc; clear;

% ¬¬¬¬¬¬¬ Data Sistem ¬¬¬¬¬¬¬
A = [ 5  ¬1  ¬1   0   0 ;
     ¬1   5  ¬1  ¬1   0 ;
     ¬1  ¬1   4  ¬1  ¬1 ;
      0   0   1   4  ¬2 ;
      0   1  ¬1   1   4 ];
b        = [¬1; 2; 6; 2; ¬1];
n        = 5;
vn       = {'p'«'q'«'r'«'s'«'t'};
MAX_ITER = 20;
TOL      = 0©001;

% ¬¬¬¬¬¬¬ Helper functions ¬¬¬¬¬¬¬
function garis¥c«len¤
  fprintf¥'%s\n'« repmat¥c«1«len¤¤;
end

function judul¥s¤
  L = 64;
  garis¥'='«L¤;
  sp = floor¥¥L¬length¥s¤¤/2¤;
  fprintf¥'%s%s\n'« repmat¥' '«1«sp¤« s¤;
  garis¥'='«L¤;
end

function sub¥s¤
  fprintf¥'\n  [+] %s\n'« s¤;
  garis¥'¬'«56¤;
end

function print_aug¥M«n¤
  for i=1:n
    fprintf¥'  |'¤;
    for j=1:n
      fprintf¥' %8©4f'« M¥i«j¤¤;
    end
    fprintf¥'  | %9©4f |\n'« M¥i«n+1¤¤;
  end
end

function print_mat¥M«n¤
  for i=1:n
    fprintf¥'  |'¤;
    for j=1:n
      fprintf¥' %9©4f'« M¥i«j¤¤;
    end
    fprintf¥'  |\n'¤;
  end
end

function print_sol¥x« vn« metode¤
  fprintf¥'\n  +¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬+\n'¤;
  fprintf¥'  | SOLUSI %¬18s|\n'« metode¤;
  fprintf¥'  +¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬+\n'¤;
  for i=1:length¥x¤
    fprintf¥'  |  %s  =  %12©6f      |\n'« vn{i}« x¥i¤¤;
  end
  fprintf¥'  +¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬+\n'¤;
end

fprintf¥'\n'¤;
judul¥'TUGAS SPL ¨ METODE NUMERIK'¤;
fprintf¥'\n'¤;
fprintf¥'  Sistem Persamaan:\n'¤;
fprintf¥'   5p ¬  q ¬  r              =  ¬1\n'¤;
fprintf¥'   ¬p + 5q ¬  r ¬  s         =   2\n'¤;
fprintf¥'   ¬p ¬  q + 4r ¬  s ¬  t    =   6\n'¤;
fprintf¥'             r + 4s ¬ 2t      =   2\n'¤;
fprintf¥'        q ¬  r +  s + 4t      =  ¬1\n\n'¤;
fprintf¥'  Matriks A :\n'¤;
fprintf¥'  |  5  ¬1  ¬1   0   0 |\n'¤;
fprintf¥'  | ¬1   5  ¬1  ¬1   0 |\n'¤;
fprintf¥'  | ¬1  ¬1   4  ¬1  ¬1 |\n'¤;
fprintf¥'  |  0   0   1   4  ¬2 |\n'¤;
fprintf¥'  |  0   1  ¬1   1   4 |\n\n'¤;
fprintf¥'  b = [¬1« 2« 6« 2« ¬1]^T\n'¤;


fprintf¥'\n\n'¤;
judul¥'METODE 1 : ELIMINASI GAUSS'¤;

tic;
Aug = [A« b];

sub¥'Matriks Augmented Awal [A|b]'¤;
print_aug¥Aug« n¤;

% Eliminasi maju
for k = 1:n¬1
  for i = k+1:n
    m        = Aug¥i«k¤ / Aug¥k«k¤;
    Aug¥i«:¤ = Aug¥i«:¤ ¬ m * Aug¥k«:¤;
  end
end

sub¥'Setelah Eliminasi Maju ¥Row Echelon Form¤'¤;
print_aug¥Aug« n¤;

% Substitusi balik
xG = zeros¥n«1¤;
for i = n:¬1:1
  xG¥i¤ = ¥Aug¥i«n+1¤ ¬ Aug¥i«i+1:n¤*xG¥i+1:n¤¤ / Aug¥i«i¤;
end
tG = toc;

sub¥'Substitusi Balik'¤;
for i = n:¬1:1
  fprintf¥'  %s = %©6f\n'« vn{i}« xG¥i¤¤;
end
print_sol¥xG« vn« 'GAUSS       '¤;
fprintf¥'\n  Running Time : %©8f detik\n'« tG¤;


fprintf¥'\n\n'¤;
judul¥'METODE 2 : ELIMINASI GAUSS¬JORDAN'¤;

tic;
Aug2 = [A« b];

sub¥'Matriks Augmented Awal [A|b]'¤;
print_aug¥Aug2« n¤;

for k = 1:n
  Aug2¥k«:¤ = Aug2¥k«:¤ / Aug2¥k«k¤;         % normalisasi
  for i = 1:n
    if i ~= k
      Aug2¥i«:¤ = Aug2¥i«:¤ ¬ Aug2¥i«k¤*Aug2¥k«:¤;
    end
  end
end

xJ = Aug2¥:« n+1¤;
tJ = toc;

sub¥'Setelah Gauss¬Jordan ¥Reduced Row Echelon Form¤'¤;
print_aug¥Aug2« n¤;
print_sol¥xJ« vn« 'GAUSS¬JORDAN'¤;
fprintf¥'\n  Running Time : %©8f detik\n'« tJ¤;

fprintf¥'\n\n'¤;
judul¥'METODE 3 : DEKOMPOSISI LU'¤;
tic;
L  = eye¥n¤;
U  = A;
for k = 1:n¬1
  for i = k+1:n
    L¥i«k¤  = U¥i«k¤ / U¥k«k¤;
    U¥i«:¤  = U¥i«:¤ ¬ L¥i«k¤*U¥k«:¤;
  end
end
% Langkah 1 : Ly = b  ¥substitusi maju¤
yLU = zeros¥n«1¤;
for i = 1:n
  yLU¥i¤ = b¥i¤ ¬ L¥i«1:i¬1¤*yLU¥1:i¬1¤;
end
% Langkah 2 : Ux = y  ¥substitusi balik¤
xLU = zeros¥n«1¤;
for i = n:¬1:1
  xLU¥i¤ = ¥yLU¥i¤ ¬ U¥i«i+1:n¤*xLU¥i+1:n¤¤ / U¥i«i¤;
end
tLU = toc;
sub¥'Matriks L ¥Lower Triangular¤'¤;
print_mat¥L« n¤;
sub¥'Matriks U ¥Upper Triangular¤'¤;
print_mat¥U« n¤;
sub¥'Langkah 1 ¨ Selesaikan L*y = b  ¥Substitusi Maju¤'¤;
for i=1:n
  fprintf¥'  y%d = %10©6f\n'« i« yLU¥i¤¤;
end
sub¥'Langkah 2 ¨ Selesaikan U*x = y  ¥Substitusi Balik¤'¤;
for i=n:¬1:1
  fprintf¥'  %s = %10©6f\n'« vn{i}« xLU¥i¤¤;
end
print_sol¥xLU« vn« 'DEKOMP LU   '¤;
fprintf¥'\n  Running Time : %©8f detik\n'« tLU¤;


fprintf¥'\n\n'¤;
judul¥'METODE 4 : ITERASI JACOBI'¤;

tic;
xJac = zeros¥n«1¤;

sub¥'Formula Iterasi'¤;
fprintf¥'  p¥k+1¤ = [ ¬1 + q¥k¤   + r¥k¤                     ] / 5\n'¤;
fprintf¥'  q¥k+1¤ = [  2 + p¥k¤   + r¥k¤   + s¥k¤            ] / 5\n'¤;
fprintf¥'  r¥k+1¤ = [  6 + p¥k¤   + q¥k¤   + s¥k¤  + t¥k¤   ] / 4\n'¤;
fprintf¥'  s¥k+1¤ = [  2 ¬ r¥k¤   + 2*t¥k¤                   ] / 4\n'¤;
fprintf¥'  t¥k+1¤ = [ ¬1 ¬ q¥k¤   + r¥k¤   ¬ s¥k¤            ] / 4\n'¤;

sub¥'Tabel Iterasi ¥tebakan awal = 0¤'¤;
fprintf¥'  %¬5s %10s %10s %10s %10s %10s %11s\n'«©©©
        'Iter'«'p'«'q'«'r'«'s'«'t'«'Max Error'¤;
garis¥'¬'«70¤;
fprintf¥'  %¬5d %10©6f %10©6f %10©6f %10©6f %10©6f %11s\n'«©©©
        0«0«0«0«0«0«'¬'¤;

iter_j = 0; err_j = Inf;
for k = 1:MAX_ITER
  xo    = xJac;
  xJac¥1¤ = ¥¬1 + xo¥2¤ + xo¥3¤¤ / 5;
  xJac¥2¤ = ¥ 2 + xo¥1¤ + xo¥3¤ + xo¥4¤¤ / 5;
  xJac¥3¤ = ¥ 6 + xo¥1¤ + xo¥2¤ + xo¥4¤ + xo¥5¤¤ / 4;
  xJac¥4¤ = ¥ 2 ¬ xo¥3¤ + 2*xo¥5¤¤ / 4;
  xJac¥5¤ = ¥¬1 ¬ xo¥2¤ + xo¥3¤ ¬ xo¥4¤¤ / 4;
  err_j   = max¥abs¥xJac ¬ xo¤¤;
  iter_j  = k;
  fprintf¥'  %¬5d %10©6f %10©6f %10©6f %10©6f %10©6f %11©6f\n'«©©©
          k«xJac¥1¤«xJac¥2¤«xJac¥3¤«xJac¥4¤«xJac¥5¤«err_j¤;
  if err_j < TOL; break; end
end
tJac = toc;

garis¥'¬'«70¤;
print_sol¥xJac« vn« 'JACOBI      '¤;
fprintf¥'\n  Total Iterasi : %d\n'« iter_j¤;
fprintf¥'  Error Akhir   : %©8f\n'« err_j¤;
fprintf¥'  Running Time  : %©8f detik\n'« tJac¤;



fprintf¥'\n\n'¤;
judul¥'METODE 5 : ITERASI GAUSS¬SEIDEL'¤;

tic;
xGS = zeros¥n«1¤;

sub¥'Formula Iterasi ¥nilai terbaru langsung digunakan¤'¤;
fprintf¥'  p¥k+1¤ = [ ¬1 + q¥k¤     + r¥k¤                       ] / 5\n'¤;
fprintf¥'  q¥k+1¤ = [  2 + p¥k+1¤   + r¥k¤   + s¥k¤              ] / 5\n'¤;
fprintf¥'  r¥k+1¤ = [  6 + p¥k+1¤   + q¥k+1¤ + s¥k¤   + t¥k¤    ] / 4\n'¤;
fprintf¥'  s¥k+1¤ = [  2 ¬ r¥k+1¤   + 2*t¥k¤                     ] / 4\n'¤;
fprintf¥'  t¥k+1¤ = [ ¬1 ¬ q¥k+1¤   + r¥k+1¤ ¬ s¥k+1¤           ] / 4\n'¤;

sub¥'Tabel Iterasi ¥tebakan awal = 0¤'¤;
fprintf¥'  %¬5s %10s %10s %10s %10s %10s %11s\n'«©©©
        'Iter'«'p'«'q'«'r'«'s'«'t'«'Max Error'¤;
garis¥'¬'«70¤;
fprintf¥'  %¬5d %10©6f %10©6f %10©6f %10©6f %10©6f %11s\n'«©©©
        0«0«0«0«0«0«'¬'¤;

iter_gs = 0; err_gs = Inf;
for k = 1:MAX_ITER
  xo      = xGS;
  xGS¥1¤  = ¥¬1 + xGS¥2¤ + xGS¥3¤¤ / 5;
  xGS¥2¤  = ¥ 2 + xGS¥1¤ + xGS¥3¤ + xGS¥4¤¤ / 5;
  xGS¥3¤  = ¥ 6 + xGS¥1¤ + xGS¥2¤ + xGS¥4¤ + xGS¥5¤¤ / 4;
  xGS¥4¤  = ¥ 2 ¬ xGS¥3¤ + 2*xGS¥5¤¤ / 4;
  xGS¥5¤  = ¥¬1 ¬ xGS¥2¤ + xGS¥3¤ ¬ xGS¥4¤¤ / 4;
  err_gs  = max¥abs¥xGS ¬ xo¤¤;
  iter_gs = k;
  fprintf¥'  %¬5d %10©6f %10©6f %10©6f %10©6f %10©6f %11©6f\n'«©©©
          k«xGS¥1¤«xGS¥2¤«xGS¥3¤«xGS¥4¤«xGS¥5¤«err_gs¤;
  if err_gs < TOL; break; end
end
tGS = toc;

garis¥'¬'«70¤;
print_sol¥xGS« vn« 'GAUSS¬SEIDEL'¤;
fprintf¥'\n  Total Iterasi : %d\n'« iter_gs¤;
fprintf¥'  Error Akhir   : %©8f\n'« err_gs¤;
fprintf¥'  Running Time  : %©8f detik\n'« tGS¤;


fprintf¥'\n\n'¤;
judul¥'SOAL 2 : GALAT METODE ITERATIF vs EKSAK'¤;

xEksak = xG;   % Gauss sebagai nilai eksak
gJac   = abs¥xEksak ¬ xJac¤;
gGS    = abs¥xEksak ¬ xGS¤;

sub¥'Galat Absolut  =  | nilai_eksak ¬ nilai_hampiran |'¤;
fprintf¥'\n  %¬6s %12s %12s %12s %12s %12s\n'«©©©
        'Var'«'Nilai Eksak'«'Jacobi'«'|Galat J|'«'Gauss¬Seidel'«'|Galat GS|'¤;
garis¥'¬'«68¤;
for i=1:n
  fprintf¥'  %¬6s %12©6f %12©6f %12©6f %12©6f %12©6f\n'«©©©
          vn{i}« xEksak¥i¤« xJac¥i¤« gJac¥i¤« xGS¥i¤« gGS¥i¤¤;
end
garis¥'¬'«68¤;
fprintf¥'  %¬6s %12s %12s %12©6f %12s %12©6f\n'«©©©
        'TOTAL'«''«''«sum¥gJac¤«''«sum¥gGS¤¤;
fprintf¥'\n  Max Galat Jacobi       : %©8f\n'« max¥gJac¤¤;
fprintf¥'  Max Galat Gauss¬Seidel : %©8f\n'« max¥gGS¤¤;

if max¥gGS¤ < max¥gJac¤
  fprintf¥'\n  >> Gauss¬Seidel LEBIH AKURAT dari Jacobi pada iterasi ini©\n'¤;
else
  fprintf¥'\n  >> Jacobi lebih akurat dari Gauss¬Seidel pada iterasi ini©\n'¤;
end


fprintf¥'\n\n'¤;
judul¥'SOAL 3 : RUNNING TIME & KOMPLEKSITAS'¤;

sub¥'Perbandingan Running Time'¤;
fprintf¥'\n  %¬20s %16s %10s %14s\n'«'Metode'«'Running Time ¥s¤'«'Iterasi'«'Kompleksitas'¤;
garis¥'¬'«64¤;
fprintf¥'  %¬20s %16©8f %10s %14s\n'«'Gauss'«        tG«   '¬'«     'O¥n^3 / 3¤'¤;
fprintf¥'  %¬20s %16©8f %10s %14s\n'«'Gauss¬Jordan'« tJ«   '¬'«     'O¥n^3 / 2¤'¤;
fprintf¥'  %¬20s %16©8f %10s %14s\n'«'Dekomposisi LU'«tLU« '¬'«     'O¥n^3 / 3¤'¤;
fprintf¥'  %¬20s %16©8f %10d %14s\n'«'Jacobi'«       tJac« iter_j«  'O¥k * n^2¤'¤;
fprintf¥'  %¬20s %16©8f %10d %14s\n'«'Gauss¬Seidel'« tGS«  iter_gs« 'O¥k * n^2¤'¤;
garis¥'¬'«64¤;

sub¥'Estimasi Operasi Teoritis  ¥n = 5¤'¤;
fprintf¥'  Gauss         : ~%d  operasi\n'« round¥n^3/3¤¤;
fprintf¥'  Gauss¬Jordan  : ~%d  operasi\n'« round¥n^3/2¤¤;
fprintf¥'  LU            : ~%d  operasi\n'« round¥n^3/3¤¤;
fprintf¥'  Jacobi        : ~%d  operasi  ¥%d iter x n^2¤\n'« iter_j*n^2«  iter_j¤;
fprintf¥'  Gauss¬Seidel  : ~%d  operasi  ¥%d iter x n^2¤\n'« iter_gs*n^2« iter_gs¤;



fprintf¥'\n\n'¤;
judul¥'RINGKASAN SOLUSI SEMUA METODE'¤;
fprintf¥'\n  %¬20s %10s %10s %10s %10s %10s\n'«©©©
        'Metode'«'p'«'q'«'r'«'s'«'t'¤;
garis¥'='«72¤;
fprintf¥'  %¬20s %10©6f %10©6f %10©6f %10©6f %10©6f\n'«©©©
        'Gauss'«          xG¥1¤« xG¥2¤« xG¥3¤« xG¥4¤« xG¥5¤¤;
fprintf¥'  %¬20s %10©6f %10©6f %10©6f %10©6f %10©6f\n'«©©©
        'Gauss¬Jordan'«   xJ¥1¤« xJ¥2¤« xJ¥3¤« xJ¥4¤« xJ¥5¤¤;
fprintf¥'  %¬20s %10©6f %10©6f %10©6f %10©6f %10©6f\n'«©©©
        'Dekomposisi LU'« xLU¥1¤«xLU¥2¤«xLU¥3¤«xLU¥4¤«xLU¥5¤¤;
fprintf¥'  %¬20s %10©6f %10©6f %10©6f %10©6f %10©6f\n'«©©©
        'Jacobi'«         xJac¥1¤«xJac¥2¤«xJac¥3¤«xJac¥4¤«xJac¥5¤¤;
fprintf¥'  %¬20s %10©6f %10©6f %10©6f %10©6f %10©6f\n'«©©©
        'Gauss¬Seidel'«   xGS¥1¤«xGS¥2¤«xGS¥3¤«xGS¥4¤«xGS¥5¤¤;
garis¥'='«72¤;
fprintf¥'\n  Toleransi   : %©3f   |   Max Iterasi : %d\n\n'« TOL« MAX_ITER¤;
fprintf¥'\n'¤;
