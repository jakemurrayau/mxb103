function[bounces] = task1(n,y)

bounces = 0; %Create counter for every bounce within 60 seconds

for i = 2:n
    if(y(i) > y(i+1) && y(i) > y(i-1)) %If statement that counts every bounce
        bounces = bounces + 1;
    end
end

end
