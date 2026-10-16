function soal2¥¤
% SOAL 2: METODE BISEKSI & REGULA¬FALSI
% Maksimal 20 iterasi« toleransi 0©0001

clc; clear;
% ¬¬¬¬¬¬¬¬¬¬ Definisi fungsi f¥x¤ = 0 ¬¬¬¬¬¬¬¬¬¬
f1 = @¥x¤ 3*x©^3 ¬ 5*x©^2 + 4*x ¬ 8;
f2 = @¥x¤ exp¥x¤ ¬ x©^2;
f3 = @¥x¤ log¥x+2¤ + 2*x ¬ 3;

n = 20;
tol = 1e¬4;

% PERSAMAAN 1
disp¥'=================================================='¤;
disp¥'   PERSAMAAN 1: f¥x¤ = 3x^3 ¬ 5x^2 + 4x ¬ 8'¤;
disp¥'=================================================='¤;
disp¥'¬¬¬ Metode Biseksi ¥20 iterasi¤ ¬¬¬'¤;
c1b = Biseksi20¥f1« 1« 2« n« tol¤;
disp¥'¬¬¬ Metode Regula¬Falsi ¥20 iterasi¤ ¬¬¬'¤;
c1r = RegulaFalsi20¥f1« 1« 2« n« tol¤;
% PERSAMAAN 2
disp¥' '¤;
disp¥'=================================================='¤;
disp¥'   PERSAMAAN 2: f¥x¤ = e^x ¬ x^2'¤;
disp¥'=================================================='¤;
disp¥'¬¬¬ Metode Biseksi ¥20 iterasi¤ ¬¬¬'¤;
c2b = Biseksi20¥f2« ¬1« 0« n« tol¤;
disp¥'¬¬¬ Metode Regula¬Falsi ¥20 iterasi¤ ¬¬¬'¤;
c2r = RegulaFalsi20¥f2« ¬1« 0« n« tol¤;
% PERSAMAAN 3
disp¥' '¤;
disp¥'=================================================='¤;
disp¥'   PERSAMAAN 3: f¥x¤ = ln¥x+2¤ + 2x ¬ 3'¤;
disp¥'=================================================='¤;
disp¥'¬¬¬ Metode Biseksi ¥20 iterasi¤ ¬¬¬'¤;
c3b = Biseksi20¥f3« 0« 1« n« tol¤;
disp¥'¬¬¬ Metode Regula¬Falsi ¥20 iterasi¤ ¬¬¬'¤;
c3r = RegulaFalsi20¥f3« 0« 1« n« tol¤;

% RINGKASAN

fprintf¥'\n\n'¤;
fprintf¥'==================================================\n'¤;
fprintf¥'              RINGKASAN HASIL SOAL 2\n'¤;
fprintf¥'==================================================\n'¤;
fprintf¥'Pers\tBiseksi ¥akar¤\t\tRegula¬Falsi ¥akar¤\n'¤;
fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
fprintf¥'1\t%©6f\t\t%©6f\n'« c1b« c1r¤;
fprintf¥'2\t%©6f\t\t%©6f\n'« c2b« c2r¤;
fprintf¥'3\t%©6f\t\t%©6f\n'« c3b« c3r¤;
fprintf¥'==================================================\n'¤;

end % akhir fungsi utama


% FUNGSI BISEKSI ¥20 ITERASI PENUH¤

function c = Biseksi20¥f« a« b« n« tol¤
  fa = f¥a¤;
  fb = f¥b¤;
  if fa*fb > 0
    error¥'Warning: f¥a¤ dan f¥b¤ sama tanda©'¤;
  endif
  fprintf¥'\nIter\ta\t\tb\t\tf¥a¤\t\tf¥b¤\t\tc\t\tf¥c¤\t\tError\n'¤;
  fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
  c = a;
  for i = 1:n
    c_old = c;
    c  = ¥a + b¤/2;
    fc = f¥c¤;
    err = abs¥c ¬ c_old¤;
    fprintf¥'%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n'« i« a« b« fa« fb« c« fc« err¤;
    if fa*fc == 0
      break;
    elseif fa*fc < 0
      b = c;
      fb = f¥b¤;
    else
      a = c;
      fa = f¥a¤;
    endif
  endfor
  fprintf¥'\n>> Akar ¥Biseksi¤ = %©6f\n'« c¤;
endfunction

% FUNGSI REGULA¬FALSI ¥20 ITERASI PENUH¤

function c = RegulaFalsi20¥f« a« b« n« tol¤
  fa = f¥a¤;
  fb = f¥b¤;
  if fa*fb > 0
    error¥'Warning: f¥a¤ dan f¥b¤ sama tanda©'¤;
  endif
  fprintf¥'\nIter\ta\t\tb\t\tf¥a¤\t\tf¥b¤\t\tc\t\tf¥c¤\t\tError\n'¤;
  fprintf¥'¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n'¤;
  c = a;
  for i = 1:n
    c_old = c;
    c  = ¥a*fb ¬ b*fa¤/¥fb ¬ fa¤;
    fc = f¥c¤;
    err = abs¥c ¬ c_old¤;
    fprintf¥'%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n'« i« a« b« fa« fb« c« fc« err¤;
    if fa*fc == 0
      break;
    elseif fa*fc < 0
      b = c;
      fb = f¥b¤;
    else
      a = c;
      fa = f¥a¤;
    endif
  endfor
  fprintf¥'\n>> Akar ¥Regula¬Falsi¤ = %©6f\n'« c¤;
endfunction
