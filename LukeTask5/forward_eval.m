function y = forward_eval(X, T, x)
% FORWARD_EVAL Evaluates Newton's forward difference form of the 
% interpolating polynomial.
% y = forward_eval(X, T, x) returns y = P(x), where P is the interpolating  
% polynomial constructed using the abscissas X = [x0,x1,...,xn] and forward
% difference table T.

% Gets the spacing between the abscissas (even spacing is assumed) and uses
% it to calculate s, from the definition
h = X(2)-X(1);
s = (x - X(1)) / h;

n = length(X);

y = zeros(size(x));         % Initialise sum
for k = 1:n
    C = 1/factorial(k-1);   % Initialise product of binomial coefficients
    for i = 0:k-2
       C = C .* (s - i); 
    end
    y = y + C * T(k,k);     % Add next term
end