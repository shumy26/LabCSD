clear; clc; close all;

%% 1. Parâmetros do Sistema Mecânico
M = 2; % kg
b = 5; % Ns/m
K = 3; % N/m

% Função de transferência: G(s) = 1 / (M*s^2 + b*s + K)
num = 1;
den = [M b K];
G = tf(num, den);

disp('Função de transferência do sistema G(s):');
G

%% 2. Resposta Analítica / Simbólica (Teórica)
syms s t
G_s = 1 / (M*s^2 + b*s + K);

% A resposta ao impulso h(t) é a transformada inversa de Laplace de G(s)
h_t = ilaplace(G_s, s, t);

disp('Expressão teórica da resposta ao impulso h(t):');
disp(vpa(h_t, 4));

%% 3. Simulação Numérica e Comparação Gráfica
t_sim = 0:0.01:10;

% Resposta teórica calculada pela equação analítica
% h(t) = exp(-t) - exp(-1.5*t)
h_teorica = double(subs(h_t, t, t_sim));

% Resposta numérica obtida pela função impulse do MATLAB
[h_matlab, t_out] = impulse(G, t_sim);

% Plotagem comparativa
figure('Name', 'Resposta ao Impulso');
plot(t_out, h_matlab, 'b-', 'LineWidth', 2, 'DisplayName', 'Comando impulse (MATLAB)');
hold on;
plot(t_sim, h_teorica, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Resposta Teórica: e^{-t} - e^{-1.5t}');
grid on;
title('Resposta ao Impulso do Sistema Mecânico');
xlabel('Tempo (s)');
ylabel('Posição x(t) [m]');
legend('Location', 'northeast');

%% 4. Ponto de Máximo da Resposta ao Impulso
% t_pico = ln(1.5) / (1.5 - 1) = 2 * ln(1.5) ≈ 0.8109 s
t_pico = log(1.5) / (1.5 - 1);
x_max = exp(-t_pico) - exp(-1.5*t_pico);

fprintf('\n--- Valores Teóricos Notáveis ---\n');
fprintf('Instante de pico: %.4f s\n', t_pico);
fprintf('Amplitude máxima:  %.4f m\n', x_max);