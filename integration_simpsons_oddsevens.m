%Variables needed: velocity vector, h

f_absv = @(t) abs(v(t));
n_int=600000;
a_int = 1; %index 1
b_int = 600001; %index end
S = 0; %ODD abscissas 
if mod(b_int,2)==0
    lasteven=b_int-2;
    lastodd=b_int-1;
else
    lasteven=b_int-1;
    lastodd=b_int-2;
end
    
for j = 3:2:lastodd
    S = S + f_absv(j);
end
Q = 0; %EVEN abscissas
for j = 2:2:lasteven
    Q = Q + f_absv(j);
end
I_int = h/3 * (f_absv(a_int) + 4*S + 2*Q + f_absv(b_int))
