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
%Conclus�o: Como o sinal � n�o-peri�dico e discreto no tempo, sua
%representa��o no dom�nio da frequ�ncia ser� cont�nua e peri�dica. Pudemos
%validar a resolu��o anal�tica atrav�s da reconstru��o do sinal; Cem
%amostras, por�m, n�o foram o suficiente para chegar ao sinal inicial
%ideal. 

clc 
clear all

o = -5:0.001:5;

figure
plot(o,abs(X4(o)));%Simetria par
title('Representa��o dos m�dulos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$\left| X({ e }^{ j\Omega  }) \right|  $','Interpreter','LaTex');

figure
plot(o,angle(X4(o))); %Simetria �mpar
title('Representa��o das fases dos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\Omega$','Interpreter','LaTex');
ylabel('$arg\{ X({ e }^{ j\Omega  })\}  $','Interpreter','LaTex');


fig = figure;
fig.Name = 'Quest�o 4';

subplot(1,3,1)
o = linspace(-pi,pi,10)
inversa = [];
for n = -5:5;
    soma = 0;
    for i = 1:length(o)
        soma = soma + X4(o(i)).*exp(j*o(i)*n)*(o(2)-o(1));
    end
    inversa = [inversa, (1/(2*pi).*soma)];
end
n = -5:5;
stem(n,inversa);
title('Reconstru��o do sinal com 10 amostras');
xlabel('n')
ylabel('${x}_{4}[n]$','Interpreter','LaTex');

subplot(1,3,2)

inversa = [];
o = linspace(-pi,pi,20)
for n = -5:5;
    soma = 0;
    for i = 1:length(o)
        soma = soma + X4(o(i)).*exp(j*o(i)*n)*(o(2)-o(1));
    end
    inversa = [inversa, 1/(2*pi)*soma];
end
n = -5:5;
stem(n,inversa);
title('Reconstru��o do sinal com 20 amostras');
xlabel('n')
ylabel('${x}_{4}[n]$','Interpreter','LaTex');

subplot(1,3,3)
o = linspace(-pi,pi,100);
inversa = [];
for n = -5:5;
    soma = 0;
    for i = 1:length(o)
        soma = soma + X4(o(i)).*exp(j*o(i)*n)*(o(2)-o(1));
    end
    inversa = [inversa, 1/(2*pi)*soma];
end

n = -5:5;
stem(n,inversa); %Converge para o sinal original
title('Reconstru��o do sinal com 100 amostras');
xlabel('n')
ylabel('${x}_{4}[n]$','Interpreter','LaTex');
