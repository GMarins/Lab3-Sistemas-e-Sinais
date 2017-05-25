%%%%%%%%%%%%%%%%%%LAB 3 - QUEST�O 1 %%%%%%%%%%%%%%%%
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
%Conclus�o: como o sinal � cont�nuo e per�odico, sua representa��o no dom�nio da
%frequ�ncia ser� discreta e n�o peri�dica. Analisamos, este caso - pelos
%mesmos motivos anteriormente apresentados - atrav�s da S�rie de Fourier.
clc
clear all

k = -5:5;

figure
stem(k,X1(k))
xlabel('t')
ylabel('${X}_{1}(t)$','Interpreter','LaTex');
title('Representa��o do sinal no dom�nio da frequ�ncia');


fig = figure;
fig.Name = 'Quest�o 1';
w = pi;

subplot(1,3,1)

inversa = [];
for t = -5:0.001:5;
    soma = 0;
    for k = -5:5
        soma = soma + X1(k)*exp(j*k*w*t);
    end
    inversa = [inversa soma];
end
t = -5:0.001:5;
plot(t,inversa);
title('Reconstru��o do sinal com 10 amostras');
xlabel('t')
ylabel('${x}_{3}(t)$','Interpreter','LaTex');

subplot(1,3,2)

inversa = [];
for t = -5:0.001:5;
    soma = 0;
    for k = -10:10
        soma = soma + X1(k)*exp(j*k*w*t);
    end
    inversa = [inversa soma];
end
t = -5:0.001:5;
plot(t,inversa);
title('Reconstru��o do sinal com 20 amostras');
xlabel('t')
ylabel('${x}_{3}(t)$','Interpreter','LaTex');

subplot(1,3,3)

inversa = [];
for t = -5:0.001:5;
    soma = 0;
    for k = -50:50
        soma = soma + X1(k)*exp(j*k*w*t);
    end
    inversa = [inversa soma];
end

t = -5:0.001:5;
plot(t,inversa);
title('Reconstru��o do sinal com 100 amostras');
xlabel('t')
ylabel('${x}_{1}(t)$','Interpreter','LaTex');

