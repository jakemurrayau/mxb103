%%function [t, w, h] = a2_rk4(f, a, b, alpha, n)
%RK4 Fourth Order Runge-Kutta method
% [t, w, h] = rk4(f, a, b, alpha, n) performs the fourth order Runge-Kutta
% method for solving the IVP y' = f(t,y) with initial condition y(a) = alpha
% taking n steps from t = a to t = b.
a=0;
b=65;
n=250000;
%not changable
m=80;
g = 9.8;
c = 0.9;
C = c/m;
alpha = 0;
%changable variables
%original set
k = 90; L = 25;

%the special boi
K = k/m;
%functions
f2 = @(v) v;
f1 = @(t,y,v) 9.8 - (0.9/80)*abs(v)*v - max(0,k/80*(y-L));


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

% distance from water first jump
dis_from_water_original_jump = 74-max(y)-1.75
%1st set:
%k = 900; L = 25;
%2nd set:
%k = 90; L = 250;
%3rd set:
%k = 90; L = 43;
%4th set: (the set that meets the requirements)
k = 80; L = 43;


%the special boi
K = k/m;
%functions
f2 = @(v) v;
f1 = @(t,y,v) 9.8 - (0.9/80)*abs(v)*v - max(0,k/80*(y-L));


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
%creating velocitiy graph
figure()
plot(t,v)
%creating displacment graph
figure()
plot(t,y)
%setting a variable to hol maximum acceleration
maxi_a = 0;
%a loop to iterate through all the velocity and acceleration pairs to get max acceleration
for i = 1:length(v)     
        temp_v = v(i);  % creating a temporary velocity value
        temp_y = y(i);  % creating a temporary displacement value
        if abs(maxi_a) < abs(g-C.*abs(temp_v).*temp_v-K.*(temp_y-L))          % check to see if the the newest generated acceleration is greater then any previous
            maxi_a = abs(g-C.*abs(temp_v).*temp_v-K.*max(0,(temp_y-L)));      % setting the newest value to the greatest value if it was bigger
            maxi_time = i;                                                    % a variable to see what itereation of the loop the greatest value occured on
        end
end
maxi_a
maxi_time
dis_from_water_mod_jump = 74-max(y)-1.75
%end
