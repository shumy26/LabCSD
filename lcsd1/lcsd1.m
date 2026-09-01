%exercicio 1

p = [1 -2 -1 2];
x = -3:0.1:3;
y = polyval(p,x);
plot(x,y,'r.');
grid on;
disp(roots(p));

%exercicio 2

A = [6 4 5; 5 11 11; -6 -10 -11];
detA = det(A);

B = inv(A);

[P,D] = eig(A);

teste_inversa_1 = A * B;       
teste_inversa_2 = B * A;       

teste_autovetor = A * P(:,1);   
teste_autovalor = D(1,1) * P(:,1);

%questao 1 
% AX=B -> X = A\B

disp('questao 1');

A = [1  1  2;
    2  4 -3;
    3  6 -5];

B = [9;
    1;
    0];

X = A \ B;

disp('A solução do sistema é:');
fprintf('x = %.4f\n', X(1));
fprintf('y = %.4f\n', X(2));
fprintf('z = %.4f\n', X(3));

% questao 2

disp('questao 2');

tempo = 0:0.5:5;
T = [105 126 119 129 132 128 131 135 136 132 137];
maxtempC = (max(T) - 32)/1.8;
mintempC = (min(T) - 32)/1.8;
mediatempC = (mean(T) - 32)/1.8;

fprintf('maxtempC = %.4f\n', maxtempC);
fprintf('mintempC = %.4f\n', mintempC);
fprintf('mediatempC = %.4f\n', mediatempC);

plot(tempo, T, 'r.');
grid on;
xlabel('t(min)');
ylabel('t_f(F)');
title('Temperatura de funcionamento do motor');

%questao 3
disp('questao 3');

syms s t

% ZI=V

Z = [ (s + 7 + 5/s),   -(s + 2),           -5;
    -(s + 2),        (2*s + 4 + 3/s),    -(s + 2);
    -5,              -(s + 2),           (s + 8 + 4/s) ];

V = [1; 0; 0];

delta = det(Z);

Z1 = Z; Z1(:,1) = V;
Z2 = Z; Z2(:,2) = V;
Z3 = Z; Z3(:,3) = V;

I1_s = simplify(det(Z1) / delta);
I2_s = simplify(det(Z2) / delta);
I3_s = simplify(det(Z3) / delta);

disp('--- Correntes no domínio s: I(s) ---');
pretty(collect(I1_s, s));
pretty(collect(I2_s, s));
pretty(collect(I3_s, s));

i1_t = ilaplace(I1_s, s, t);
i2_t = ilaplace(I2_s, s, t);
i3_t = ilaplace(I3_s, s, t);

disp('--- Correntes no domínio do tempo: i(t) ---');
pretty(simplify(i1_t));
pretty(simplify(i2_t));
pretty(simplify(i3_t));

%questao 4
disp('questao 4');

syms s

% ZX = F

Z = [(s^2+s+1) -(s+1); 
    -(s+1) (s^2+s+1)];
 
%definir F(s) = 1 para simplificar o calculo

F_vec = [1;0];

X = Z\F_vec;

H1 = simplify(X(1));
H2 = simplify(X(2));

disp('H1(s) = ');
pretty(H1)

disp('H2(s) = ');
pretty(H2)

disp('--- Expansão em Frações Parciais (Simbólica) ---');
disp('H1(s) em frações parciais:');
pretty(partfrac(H1, s))

disp('H2(s) em frações parciais:');
pretty(partfrac(H2, s))
