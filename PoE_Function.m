function [poe] = PoE_Function(S, theta, flag)
%POE_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

I = eye(3);
Sw = S(1:3);
Sv = S(4:6);
zero = zeros(1,3);

rodr = I + sin(theta)*skew(Sw) + (1 - cos(theta))* skew(Sw)^2;

rodr_dash = I*theta + (1 - cos(theta))* skew(Sw) + (theta - sin(theta))* skew(Sw)^2;

if flag == "tr"
 poe = [ I, Sv * theta;
         zero, 1];
else
 poe = [ rodr,  rodr_dash * Sv ;
         zero, 1];
    
end

end

