%%%%%%%%%%%%%%%%%%LAB 3 - QUEST�O 4 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Para cada sinal:
% a)Especifique as caracter� do sinal e, com base nesta informa��o, como ser�o as caracter�sticas
% da representa��o destes sinais no dom�nio da frequ�ncia (sinais cont�nuos, discretos,
% peri�dicos e n�o-peri�dicos).
% b)Identifique qual a representa��o de Fourier a ser utilizada
% c) Obtenha a representa��o do sinal no dom�nio da frequ�ncia atrav�s da aplica��o da defini��o
% de s�rie/transformada de Fourier.
% d)Obtenha a representa��o do sinal no dom�nio da frequ�ncia utilizando apenas as propriedades
% das represental��es de Fourier (especifique quais s�o utilizadas) e as representa��es de Fourier
% da onda quadrada e do pulso (cont�nuos e discretos).
% e)Implemente um arquivo lote (.m) que mostre os coeficientes da transformada/s�rie de Fourier
% e os respectivos sinais do dom�nio do tempo reconstru�dos. Reconstrua os sinais no dom�nio
% do tempo atrav�s dos coeficientes de Fourier obtidos, considerando 10, 20 e 100 coeficientes
% de Fourier. Para os casos em que � poss�vel reconstruir os sinais com um n�mero menor de
% coeficientes, utilize o n�mero m�nimo. Plote os sinais na frequ�ncia (m�dulo e fase) e no
% tempo, considerando as diferentes aproxima��es.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc 
clear all

o = -5:0.001:5;

figure
plot(o,abs(X4(o)));
title('Representa��o dos m�dulos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$\left| X({ e }^{ j\Omega  }) \right|  $','Interpreter','LaTex');

figure
plot(o,angle(X4(o)));
title('Representa��o das fases dos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\Omega$','Interpreter','LaTex');
ylabel('$arg\{ X({ e }^{ j\Omega  })\}  $','Interpreter','LaTex');


