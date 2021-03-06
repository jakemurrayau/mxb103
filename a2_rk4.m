%%function [t, w, h] = a2_rk4(f, a, b, alpha, n)
%RK4 Fourth Order Runge-Kutta method
% [t, w, h] = rk4(f, a, b, alpha, n) performs the fourth order Runge-Kutta
% method for solving the IVP y' = f(t,y) with initial condition y(a) = alpha
% taking n steps from t = a to t = b.
a=0;
b=65;
n=1000;

m=80;
g = 9.8;
c = 0.9;
C = c/m;
k = 90;
K = k/m;
L = 25;
alpha = 0;

f2 = @(v) v;
f1 = @(t,y,v) 9.8 - (0.9/80)*abs(v)*v - max(0,90/80*(y-25));


% calculate h
h = (b-a)/n;
% create t array
t = a:h:b;
% initialise w arrays
y = zeros(size(t));
y(1) = alpha;

v = zeros(size(t));
v(1) = alpha;
% perform iterations
for j = 1:n
    k1 = h*f1(t(j),y(j), v(j));
    k2 = h*f1(t(j)+h/2, y(j)+k1*1/2, v(j)+k1*1/2);
    k3= h*f1(t(j)+h/2, y(j)+k2*1/2, v(j)+k2*1/2);
    k4= h*f1(t(j)+h, y(j)+k3, v(j)+k3);
    v(j+1) = v(j) + (1/6)*(k1+2*k2+2*k3+k4);
    
    m1 = h*f2(v(j));
    m2 = h*f2(v(j)+m1*1/2);
    m3= h*f2(v(j)+m2*1/2);
    m4= h*f2(v(j)+m3);
    y(j+1) = y(j) + (1/6)*(m1+2*m2+2*m3+m4);
end

%end