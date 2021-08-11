% ------------------------------------------------------------------------------

% Exercício Matrix Penta-Diagonal sem simetria - Algoritmos Numéricos
% Desenvolvedor: Evandro Falcão Della Valentina de Oliveira
% GitHub: https://github.com/Evandro-FDVO

% ------------------------------------------------------------------------------

% Requesitos para a Matriz:
% * Matriz A deve ser pentadiagonal (sinétrica ou não);
% * Ax=b
% * f>e>d && f>g>h

% * Exemplo: A = | f1 e1 d1 0  0  | ,   b = | b1 |
%                | g1 f2 e2 d2 0  |         | b2 |
%                | h1 g2 f3 e3 d3 |         | b3 |
%                | 0  h2 g3 f4 e4 |         | b4 |
%                | 0  0  h3 g4 f5 |         | b5 |

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all

% ------------------------------------------------------------------------------

% Import Matriz CSV (Preferi usar o dlmread ao csvread)
A = dlmread('D:\Dados Evandro\01 - Ufes\Algoritmos Numéricos\Exercicio-LU-Algoritmo-Numerico\Matriz_A.csv', ',');% Matriz A
b = dlmread('D:\Dados Evandro\01 - Ufes\Algoritmos Numéricos\Exercicio-LU-Algoritmo-Numerico\Matriz_b.csv', ',');% Matriz b

% Variáveis
l = length(A);% Tamanho da matriz A

A_esc = zeros(l,l);% Alocando espaço para a Matriz Escalonada 'A_esc' a partir da matriz A
d = zeros(1,l-2);% Alocando espaço para o vetor 'd' a partir da matriz A
e = zeros(1,l-1);% Alocando espaço para o vetor 'e' a partir da matriz A
f = zeros(1,l);% Alocando espaço para o vetor 'f' a partir da matriz A
g = zeros(1,l-1);% Alocando espaço para o vetor 'g' a partir da matriz A
h = zeros(1,l-2);% Alocando espaço para o vetor 'h' a partir da matriz A

% ------------------------------------------------------------------------------

% Escalonamento da Matriz 'A'

A_esc = A;
for k=1:l-1
  for j=k+1:l
    lambda=A_esc(j,k)/A_esc(k,k);
    A_esc(j,k)=lambda;
    for i=k+1:l
      A_esc(j,i)=A_esc(j,i)-lambda*A_esc(k,i);
    endfor
  endfor
endfor

% ------------------------------------------------------------------------------

% Lendo a matriz 'A_esc' e atribuindo valores aos vetores 'd', 'e', 'f', 'g' e 'g'
% e atribuindo valores às matrizes 'L' e 'U'

for i = 1:l
  for j = 1:l
    if i == j
     f(1,j) = A_esc(i,j);
     U(j,j) = f(1,j);
     L(j,j) = 1;
    endif
    if j <= l-1
      e(1,j) = A_esc(j,j+1);
      U(j,j+1) = e(1,j);
    endif
    if j <= l-1
      g(1,j) = A_esc(j+1,j);
      L(j+1,j) = g(1,j);
    endif
    if j <= l-2
      d(1,j) = A_esc(j,j+2);
      U(j,j+2) = d(1,j);
    endif
    if j <= l-2
      h(1,j) = A_esc(j+2,j);
      L(j+2,j) = h(1,j);
    endif
  endfor
endfor
#d e f g h L U

% ------------------------------------------------------------------------------

% Solução para a Decomposição LU: Ly=b -> Ux=y

X_comparacao=A\b% Valor comparativo

if size(b,2) > 1; b = b'; end
  n = length(b);
for k = 2:n
  b(k) = b(k) - A_esc(k,1:k-1)*b(1:k-1);
end
for k = n:-1:1
  b(k) = (b(k) - A_esc(k,k+1:n)*b(k+1:n))/A_esc(k,k);
end
x = b

% ------------------------------------------------------------------------------