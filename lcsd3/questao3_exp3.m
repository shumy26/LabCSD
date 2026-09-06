syms R_2 C


wn = 6718.48;
zeta = 0.6266;
two_zeta_wn = 2 * zeta * wn; 


eq1 = wn^2 == 1 / (C + (R_2*C)/10^6);
eq2 = two_zeta_wn == (R_2*C + 10^(-6)) / (C + (R_2*C)/10^6);


[sol_R2, sol_C] = solve([eq1, eq2], [R_2, C]);


R2_num = double(sol_R2);
C_num  = double(sol_C);

fprintf('--- Resultados do Projeto ---\n');
fprintf('R_2 = %.2f Ohms (%.2f kOhm)\n', R2_num, R2_num/1e3);
fprintf('C   = %.2e Farads (%.2f nF)\n', C_num, C_num*1e9);