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
%Conclusão: Como o sinal é não-periódico e discreto no tempo, sua
%representação no domínio da frequência será contínua e periódica. Pudemos
%validar a resolução analítica através da reconstrução do sinal; Cem
%amostras, porém, não foram o suficiente para chegar ao sinal inicial
%ideal. 

clc 
clear all

o = -5:0.001:5;

figure
plot(o,abs(X4(o)));%Simetria par
title('Representação dos módulos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$\left| X({ e }^{ j\Omega  }) \right|  $','Interpreter','LaTex');

figure
plot(o,angle(X4(o))); %Simetria ímpar
title('Representação das fases dos coeficientes da Transformada de Fourier em Tempo Discreto');
xlabel('$\Omega$','Interpreter','LaTex');
ylabel('$arg\{ X({ e }^{ j\Omega  })\}  $','Interpreter','LaTex');


fig = figure;
fig.Name = 'Questão 4';

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
title('Reconstrução do sinal com 10 amostras');
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
title('Reconstrução do sinal com 20 amostras');
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
title('Reconstrução do sinal com 100 amostras');
xlabel('n')
ylabel('${x}_{4}[n]$','Interpreter','LaTex');
