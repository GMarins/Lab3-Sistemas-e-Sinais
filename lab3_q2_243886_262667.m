%%%%%%%%%%%%%%%%%%LAB 3 - QUEST�O 2 %%%%%%%%%%%%%%%%
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
%Conclus�o: Como o sinal � n�o-per�odo e cont�nuo, utilizaremos a
%Transformada de Fourier para analis�-lo no dom�nio da frequ�ncia. Sua
%representa��o ser� cont�nua e n�o-peri�dica. A resposta em frequ�ncia,
%al�m de tamb�m poder ser obtida atrav�s da defini��o usual da integral,
%pode tamb�m ser feita atrav�s da propriedade da LINEARIDADE, somando-se dois
%pulsos (um de -1 a 0 e outro de 0 a 1) e relacionando-os � conhecida
%resposta em frequ�ncia do degrau unit�rio. Com o uso da ferramenta
%computacional, pudemos confirmar a simetria par no m�dulo da resposta em
%frequ�ncia e a simetria �mpar na fase. A reconstru��o do sinal validou
%nossa resolu��o anal�tica; o sinal original, por ter mudan�as bruscas em
%seus valores, necessita de muitos coeficientes e de muitas amostras para
%ser reconstru�do. Cem amostras nos mostram que a reconstru��o converge
%para o sinal original, por�m mais amostras s�o necess�rias para um
%resultado mais satisfat�rio.


figure
w = -20:0.001:20; %Range escolhido para melhor visualizar as propriedades
plot(w,abs(X2(w))); %Simetria par
title('Representa��o dos m�dulos coeficientes da Transformada de Fourier');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$\left| X(j\omega ) \right| $','Interpreter','LaTex');

figure
plot(w,angle(X2(w))); %Simetria �mpar
title('Representa��o das fases dos coeficientes da Transformada de Fourier');
xlabel('$\omega$','Interpreter','LaTex');
ylabel('$arg\{ X(j\omega )\}  $','Interpreter','LaTex');

%%
fig = figure;
fig.Name = 'Quest�o 1';
fig.OuterPosition = [0 0 1000 700];


%%
subplot(1,3,1);

%x(t) = 1/(2pi)*Int(-inf,inf)(X(jw)*exp(jwt)*dw)
%C�lculo iterativo da integral
w = linspace(-50,50,10); %Escolhido um range dos 100 coeficientes de forma sim�trica
inversa = [];
for t = -5:0.01:5
    integral = 0;
    for i=1:length(w)
        integral = integral + X2(w(i)).*exp(j*w(i)*t)*(w(2)-w(1)); %w2 - w1 = dw (cte)
    end
    inversa = [inversa, 1/(2*pi)*integral];
end
    
t = -5:0.01:5;      
plot(t,inversa);
title('Reconstru��o do sinal com 10 amostras');
xlabel('t')
ylabel('${x}_{2}(t)$','Interpreter','LaTex');


subplot(1,3,2);

w = linspace(-50,50,20);
inversa = [];
for t = -5:0.01:5
    integral = 0;
    for i=1:length(w)
        integral = integral + X2(w(i)).*exp(j*w(i)*t)*(w(2)-w(1));
    end
    inversa = [inversa, 1/(2*pi)*integral];
end
    
t = -5:0.01:5;      
plot(t,inversa);
title('Reconstru��o do sinal com 20 amostras');
xlabel('t')
ylabel('${x}_{2}(t)$','Interpreter','LaTex');

subplot(1,3,3);

w = linspace(-50,50,100);
inversa = [];
for t = -5:0.01:5
    integral = 0;
    for i=1:length(w)
        integral = integral + X2(w(i)).*exp(j*w(i)*t)*(w(2)-w(1));
    end
    inversa = [inversa, 1/(2*pi)*integral];
end
    
t = -5:0.01:5;      
plot(t,inversa); %Converge para o sinal original
title('Reconstru��o do sinal com 100 amostras');
xlabel('t')
ylabel('${x}_{2}(t)$','Interpreter','LaTex');