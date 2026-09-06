%Exercicio 1 exp 3
K = 2;
a = 3.1; %Matricula 231025931
num = K;
den = [1, a + K];
sys = tf(num, den);
step(sys);
grid on;
title('Resposta ao Degrau em Malha Fechada');
hold on;
yline(0.632 * 0.392, 'r--', '63.2% y_{ss} (0.248)');