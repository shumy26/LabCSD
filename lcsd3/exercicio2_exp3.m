% Exercicio 2 exp 3
K = 25;
a = 3.1; % Matricula 231025931
num = K;
den = [1, a, K];
sys = tf(num, den);
step(sys);
grid on;
title('Resposta ao Degrau em Malha Fechada');
hold on;
yline(0.632 * 1, 'r--', '63.2% y_{ss} (0.632)');
figure;
pzmap(sys);
grid on;
title('Mapa de Polos e Zeros');
% Alternativamente
polos = pole(sys);
zeros = zero(sys);
disp(polos);
disp(zeros);