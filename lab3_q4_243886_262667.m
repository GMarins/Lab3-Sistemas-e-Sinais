%%%%%%%%%%%%%%%%%%LAB 3 - QUESTÃO 4 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Para cada sinal:
% a)Especifique as caracterí do sinal e, com base nesta informação, como serão as características
% da representação destes sinais no domínio da frequência (sinais contínuos, discretos,
% periódicos e não-periódicos).
% b)Identifique qual a representação de Fourier a ser utilizada
% c) Obtenha a representação do sinal no domínio da frequência através da aplicação da definição
% de série/transformada de Fourier.
% d)Obtenha a representação do sinal no domínio da frequência utilizando apenas as propriedades
% das representalções de Fourier (especifique quais são utilizadas) e as representações de Fourier
% da onda quadrada e do pulso (contínuos e discretos).
% e)Implemente um arquivo lote (.m) que mostre os coeficientes da transformada/série de Fourier
% e os respectivos sinais do domínio do tempo reconstruídos. Reconstrua os sinais no domínio
% do tempo através dos coeficientes de Fourier obtidos, considerando 10, 20 e 100 coeficientes
% de Fourier. Para os casos em que é possível reconstruir os sinais com um número menor de
% coeficientes, utilize o número mínimo. Plote os sinais na frequência (módulo e fase) e no
% tempo, considerando as diferentes aproximações.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc 
clear all

o = -5:0.001:5;

figure
plot(o,abs(X4(o)));
title('Representação dos módulos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$\left| X({ e }^{ j\Omega  }) \right|  $','Interpreter','LaTex');

figure
plot(o,angle(X4(o)));
title('Representação das fases dos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\Omega$','Interpreter','LaTex');
ylabel('$arg\{ X({ e }^{ j\Omega  })\}  $','Interpreter','LaTex');


