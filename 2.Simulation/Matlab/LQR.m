clear all

m = 21.2;
l = 0.293727;
J = 0.435038523 + m*l^2;
I = 0.001536613;

M = 0.8;

R = 0.9;

g = 9.8;

A_m = (-m^2*l^2*g)/(J*(M+m)+M*m*l^2)

B_m = (m+M)*m*g*l/(J*(M+m)+M*m*l^2)

C_m = (J+m*l^2)/((J*(M+m)+M*m*l^2)*(I/R+2*M*R))
%C_m = (J+m*l^2)/(J*(M+m)+M*m*l^2)

D_m = (-m*l)/((J*(M+m)+M*m*l^2)*(I/R+2*M*R))
%D_m = (-m*l)/(J*(M+m)+M*m*l^2)

A = [0 1 0   0;
     0 0 A_m 0;
     0 0 0   1;
     0 0 B_m 0];

B = [0;
     C_m;
     0;
     D_m];

Q = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1];
R = 1;
K = lqr(A,B,Q,R)
