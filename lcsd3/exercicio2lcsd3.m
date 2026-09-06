K = 25;
a = 2.6;

G = tf(K, [1 a 0]);

T = feedback(G, 1);


figure;
step(T);
grid on;
title('Resposta ao Degrau Unitário em Malha Fechada');
xlabel('Tempo (s)');
ylabel('Amplitude c(t)');

figure('Name', 'Polos e Zeros');
pzmap(T);
grid on;
title('Mapa de Polos e Zeros - H(s)');


polos_teoricos = roots([1 a K]);
disp('Polos calculados via raízes do denominador:');
disp(polos_teoricos);