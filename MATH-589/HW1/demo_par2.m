% Demonstration for solving the heat equation.
%   Compared with 'demo_par1.m', this version has used vector operations
%     as much as possible. It's faster in Matlab for large problems 
%     (J or/and n large).
%  u_t = u_xx, for 0<t<T, 0<x<1
%  IC: u(x,0) = 2x, for 0<x<1/2 and u(x,0)=2(1-x) for 1/2<x<1
%  BC: u(0,t) = u(1,t) = 0, for t>0
% 
% set the grid size
J=100; dx=1./J;
% set the initial conidtion in 'U' and is overwritten each time step  
x = dx*(0:J);
U(1:J/2) = 2*x(1:J/2);
U(J/2+1:J+1)=2-2*x(J/2+1:J+1);
% define a new variable to store new values of U;
Unew=U;
mu = 0.48; dt = mu*dx^2; T=0.1;
nt = round(T/dt); 
for n = 1:nt
    t = n*dt;
    % heart of the program: the following line implement FTCS
    Unew(2:J) = U(2:J) + mu*(U(3:J+1) - 2*U(2:J) + U(1:J-1));
    U = Unew;
end
hold off
plot(x,U,'o-')
%compute the analytic/exact solution
ue=zeros(1,J+1);
nterm=5;
for k=1:nterm
    ue = ue + (8/(k*pi)^2)*sin(k*pi/2)*exp(-(k*pi)^2*t)*sin(k*pi*x);
end
hold on
plot(x,ue,'r')
