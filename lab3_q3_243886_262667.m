%%%%%%%%%%%%%%%%%%LAB 3 - QUESTÃO 3 %%%%%%%%%%%%%%%%
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
%Conclusão: Como o sinal é periódico e discreto, sua representação em
%frequência é não-periódica e discreta. A análise é feita utilizando a
%Série de Fourier em Tempo Discreto.
clc
clear all

k = -5:5;

figure
stem(k,X3(k))
xlabel('k')
ylabel('${X}_{3}[k]$','Interpreter','LaTex');
title('Representação do sinal no domínio da frequência');

fig = figure;
fig.Name = 'Questão 3';
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
title('Reconstrução do sinal com 10 amostras');
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
title('Reconstrução do sinal com 20 amostras');
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
title('Reconstrução do sinal com 100 amostras');
xlabel('n')
ylabel('${x}_{3}[n]$','Interpreter','LaTex');