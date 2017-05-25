%%%%%%%%%%%%%%%%%%LAB 3 - QUEST�O 3 %%%%%%%%%%%%%%%%
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
%Conclus�o: Como o sinal � peri�dico e discreto, sua representa��o em
%frequ�ncia � n�o-peri�dica e discreta. A an�lise � feita utilizando a
%S�rie de Fourier em Tempo Discreto.
clc
clear all

k = -5:5;

figure
stem(k,X3(k))
xlabel('k')
ylabel('${X}_{3}[k]$','Interpreter','LaTex');
title('Representa��o do sinal no dom�nio da frequ�ncia');

fig = figure;
fig.Name = 'Quest�o 3';
o = 2*pi/4;

subplot(1,3,1)

inversa = [];
for n = -5:5;
    soma = 0
    for k = -4:5
        soma = soma + X3(k)*exp(j*k*o*n);
    end
    inversa = [inversa soma/2.5];
end
n = -5:5;
stem(n,inversa);
title('Reconstru��o do sinal com 10 amostras');
xlabel('n')
ylabel('${x}_{3}[n]$','Interpreter','LaTex');

subplot(1,3,2)

inversa = [];
for n = -5:5;
    soma = 0
    for k = -9:10
        soma = soma + X3(k)*exp(j*k*o*n);
    end
    inversa = [inversa soma/5];
end
n = -5:5;
stem(n,inversa);
title('Reconstru��o do sinal com 20 amostras');
xlabel('n')
ylabel('${x}_{3}[n]$','Interpreter','LaTex');

subplot(1,3,3)

inversa = [];
for n = -5:5;
    soma = 0
    for k = -49:50
        soma = soma + X3(k)*exp(j*k*o*n);
    end
    inversa = [inversa soma/25];
end

n = -5:5;
stem(n,inversa);
axis([-5 5 0 1])
title('Reconstru��o do sinal com 100 amostras');
xlabel('n')
ylabel('${x}_{3}[n]$','Interpreter','LaTex');