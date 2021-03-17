%% Constants
L = [1, 0.5, 0.5];

I = eye(3);
%% Home position matrix
m = [0; 0.5; 1.5]; % x, y, z home positions


M = [ I m;
    0 0 0 1];

%% Forward kinematics
% Skew vectors

% First joint rotates around z only no translation
S1 = [0 0 1 0 0 0]';

% Rotation around x and the center of joint 2 is at q2
w2 = [1 0 0];
q2 = [0 0 1];
v2 = -skew(w2)*q2';
S2 = [1; 0; 0; v2];

% Third joint  translates along y and doesn't rotate
S3 = [0 0 0 0 1 0]';

% Forward kinematics
S = [S1, S2, S3];
q = [-pi/4, -pi/6, 0.5];

q1 = q(1);
q2 = q(2);
q3 = q(3);

T_poe = FK_Polar(S, q, M)
T_normal = Rz(q1)*Tz(1)*Rx(q2)*Tz(0.5)*Ty(0.5)*Ty(q3)

%% Jacobian computation

 T_normal(1:3,4) = [0;0;0];
 
Td = Rzd(q1)*Tz(1)*Rx(q2)*Tz(0.5)*Ty(0.5)*Ty(q3)/T_normal;

J1 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]';

Td = Rz(q1)*Tz(1)*Rxd(q2)*Tz(0.5)*Ty(0.5)*Ty(q3)/T_normal;

J2 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]';

Td = Rz(q1)*Tz(1)*Rx(q2)*Tz(0.5)*Ty(0.5)*Tyd(q3)/T_normal;

J3 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]';

J_n = [J1, J2, J3]

J_poe = Jac_Polar(S, q)

%% Visualization 
[Tleg1,T11, T12] =  FK_Polar(S, q, M);

%% plotting
Visualize_robot(Tleg1,T11, T12, 'blue')
