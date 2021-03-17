function [J] = Jac_Polar(S, q)
%JAC_POLAR Summary of this function goes here
%   Detailed explanation goes here
S1 = S(:,1);
S2 = S(:,2);
S3 = S(:,3);

q1 = q(1);
q2 = q(2);
q3 = q(3);

zer = zeros(3,3);

I = eye(3);
%% Joint 1 jacobian
J1 = S1;

%% Joint 2 jacobian
T1 = PoE_Function(S1, q1, "rot");

R1 = T1(1:3, 1:3);
p1 = T1(1:3, 4);

T1_adj = [ R1, zer;
           skew(p1)*R1, R1];
       
J2 = T1_adj * S2;

%% Joint 3 jacobian

T2 = T1 * PoE_Function(S2, q2, "rot");

R2 = T2(1:3, 1:3);
p2 = T2(1:3, 4);

T2_adj = [ R2, zer;
           skew(p2)*R2, R2];
       
J3 = T2_adj * S3;

J = [J1, J2, J3];
end

