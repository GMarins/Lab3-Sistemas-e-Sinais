%%%%%%%%%%%%%%%%%%LAB 3 - QUESTÃO 2 %%%%%%%%%%%%%%%%
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
%Conclusão: Como o sinal é não-período e contínuo, utilizaremos a
%Transformada de Fourier para analisá-lo no domínio da frequência. Sua
%representação será contínua e não-periódica. A resposta em frequência,
%além de também poder ser obtida através da definição usual da integral,
%pode também ser feita através da propriedade da LINEARIDADE, somando-se dois
%pulsos (um de -1 a 0 e outro de 0 a 1) e relacionando-os à conhecida
%resposta em frequência do degrau unitário. Com o uso da ferramenta
%computacional, pudemos confirmar a simetria par no módulo da resposta em
%frequência e a simetria ímpar na fase.


figure
w = -20:0.001:20;
plot(w,abs(X2(w)));
title('Representação dos módulos coeficientes da Transformada de Fourier');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$\left| X(j\omega ) \right| $','Interpreter','LaTex');

figure
plot(w,angle(X2(w)));
title('Representação das fases dos coeficientes da Transformada de Fourier');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$arg\{ X(j\omega )\}  $','Interpreter','LaTex');

%%
fig = figure;
fig.Name = 'Questão 1';
fig.OuterPosition = [0 0 1000 700];


%%
subplot(1,3,1);

%x(t) = 1/(2pi)*Int(-inf,inf)(X(jw)*exp(jwt)*dw)
%Cálculo iterativo da integral
w = linspace(-5,5,100);
inversa = [];
for t = -5:0.001:5
    integral = 0;
    for i = w
        integral = integral + X2(i).*exp(j*i*t);
    end
    inversa = [inversa, 1/(2*pi)*integral];
end
    
t = -5:0.001:5;      
plot(t,inversa);
title('Reconstrução do sinal com 10 amostras');
xlabel('t')
ylabel('${x}_{2}(t)$','Interpreter','LaTex');

