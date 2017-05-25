function [y] = X2( w )
%Função que representa o sinal da questão 2 no domínio da frequência
%   Fórmula dos coeficientes obtida através da definição da transformada de
%   Fourier. 

y = 2*j./w.*(1-cos(w));

end

