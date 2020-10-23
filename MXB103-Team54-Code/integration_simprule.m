function [distance] = integration_simprule (v, h, n)
%INTEGRATION_SIMPRULE uses numerical integration to determine the total
%distance travelled during a bungee jump with the given parameters
% Takes the velocity vector, values of h (interval size) 
% and n (number of steps) to calculate the distance 
% travelled by the jumper.

% Velocity function, absolute values
f_absv = @(t) abs(v(t));


% Odd abscissas
odds = 0;  
for j = 2:(n/2)
    odds = odds + f_absv(2*j-1);
end

% Even abscissas
evens = 0; 
for j = 1:(n/2)
    evens = evens + f_absv(2*j);
end

% Final simpsons rule summation from formula
distance = h/3 * (f_absv(1) + 4*odds + 2*evens + f_absv(n+1));

end
