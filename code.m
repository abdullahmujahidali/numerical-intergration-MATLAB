function [I,h] = Simpson(f,a,b,tol)
%% compute first approximation
%
n = 2;
h = (b-a)/n;
Iold = (h/3)*(f(a) + 4*f((a+b)/2)+ f(b));

%%
% assume a high initial error in order to
% execute while loop at least once
err = Inf;

while err>tol
  
n = n*2; % double number of sub-intervals
h = (b-a)/n; % compute h at that n

% even sum
SUMeven = 0;
for j=1:n/2-1
SUMeven = SUMeven + f(a+2*j*h);
end

% odd sum
SUModd = 0;
for j=1:n/2
SUModd = SUModd + f(a+(2*j-1)*h);
end

% integral approximation I
I = (h/3)*(f(a) + 2*SUMeven + 4*SUModd + f(b));

% compute the error (termination criterion)
err = abs((I - Iold)/Iold);

% update Iold to I
Iold = I;
end
end

