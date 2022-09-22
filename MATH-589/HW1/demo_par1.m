% Demonstration for solving the heat equation.
%  u_t = u_xx, for 0<t<T, 0<x<1
%  IC: u(x,0) = 2x, for 0<x<1/2 and u(x,0)=2(1-x) for 1/2<x<1
%  BC: u(0,t) = u(1,t) = 0, for t>0
% 
% set the grid size
J=20; dx=1./J;
% set the initial conidtion in 'U' and is overwritten each time step  
for j=1:J+1
   x(j) = (j-1)*dx;
end
for j=1:J/2
    U(j) = 2*x(j);
end
for j=J/2+1:J+1
    U(j) = 2*(1-x(j));
end
Unew=U;
mu = 0.48; dt = mu*dx^2; T=0.09;
nt = round(T/dt); 
for n = 1:nt
    t = n*dt;
    % heart of the program: the following line implement FTCS
    for j=2:J
        Unew(j) = U(j) + mu*(U(j+1) - 2*U(j) + U(j-1));
    end
    U = Unew;
end
hold off
plot(x,U,'o-')
%compute the analytic/exact solution
ue=zeros(1,J+1);
nterm=10;
for k=1:nterm
    ue = ue + (8/(k*pi)^2)*sin(k*pi/2)*exp(-(k*pi)^2*t)*sin(k*pi*x);
end
hold on
plot(x,ue,'r')
