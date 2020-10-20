% The bungee jump company suggests that the standard jump will consist of 10 “bounces”
% which should take approximately 60 seconds. (Although the jumper will still be in motion at
% this point, the jump will be considered to be over, and the the jumper will be gently raised
% all the way back onto the platform above.) Do your model results agree with this timing: 10
% bounces in around 60 seconds?

bounces = 0;

for i = 2:j
    if(y(i) > y(i+1) && y(i) > y(i-1))
        bounces = bounces + 1;
    end
end
    fprintf('\n%d bounces',bounces);
