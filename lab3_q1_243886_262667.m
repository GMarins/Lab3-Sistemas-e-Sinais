%%%%%%%%%%%%%%%%%%LAB 3 - QUESTÃO 1 %%%%%%%%%%%%%%%%
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
%Conclusão: como o sinal é contínuo e períodico, sua representação no domínio da
%frequência será discreta e não periódica. Analisamos, este caso - pelos
%mesmos motivos anteriormente apresentados - através da Série de Fourier.
clc
clear all

k = -5:5;

figure
stem(k,X1(k))
xlabel('t')
ylabel('${X}_{1}(t)$','Interpreter','LaTex');
title('Representação do sinal no domínio da frequência');


fig = figure;
fig.Name = 'Questão 1';
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
title('Reconstrução do sinal com 10 amostras');
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
title('Reconstrução do sinal com 20 amostras');
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
title('Reconstrução do sinal com 100 amostras');
xlabel('t')
ylabel('${x}_{1}(t)$','Interpreter','LaTex');

