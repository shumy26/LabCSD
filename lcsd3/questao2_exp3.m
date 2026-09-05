% questao 2 exp 3
K = 3;
b = 5;
M = 2;
num = 1;
den = [M, b, K];
sys = tf(num, den);
impulse(sys);
grid on;
title('Resposta ao Impulsoem Malha Fechada');
hold on;