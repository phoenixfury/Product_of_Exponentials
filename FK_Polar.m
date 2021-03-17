function [T, T_Pos1, T_Pos2] = FK_Polar(S, q, M)
%FK_POLAR Summary of this function goes here
S1 = S(:,1);
S2 = S(:,2);
S3 = S(:,3);

q1 = q(1);
q2 = q(2);
q3 = q(3);

I = eye(3);
M1 = [I [0 0 1]';
      0 0 0 1];
M2 = [I [0 0 1.5]';
      0 0 0 1];

T1 = PoE_Function(S1, q1, "rot");
T2 = PoE_Function(S2, q2, "rot");
T3 = PoE_Function(S3, q3, "tr");

T_Pos1 = T1 * M1;
T_Pos2 = T1* T2 * M2;
T = T1*T2*T3*M;
end

