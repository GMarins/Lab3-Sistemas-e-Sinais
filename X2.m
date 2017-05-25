function [y] = X2( w )
%Fun��o que representa o sinal da quest�o 2 no dom�nio da frequ�ncia
%   F�rmula dos coeficientes obtida atrav�s da defini��o da transformada de
%   Fourier. 

y = 2*j./w.*(1-cos(w));

end

