function [T,Y]=RK4(ydot,a,b,y0,h);
% Runge-Kutta Method for systems of ODEs
%Input  -ydot is a vactor containing  first order derivative functions
%        which is an anonymous function.
%        The first variable is t and the second variable is y
%       -a and b are the left and right end points
%       -y0 is the initial condition (vector)
%       -h is the step size
%Output -T is th vector of abscissas
%       -Y is the matrix of ordinates
T=a:h:b;
m=length(T);
Y(:,1)=y0(:);
for i=2:m
    k1=ydot(T(i-1),Y(:,i-1));
    k2=ydot(T(i-1)+h/2,Y(:,i-1)+h/2.*k1);
    k3=ydot(T(i-1)+h/2,Y(:,i-1)+h/2.*k2);
    k4=ydot(T(i-1)+h,Y(:,i-1)+h.*k3);
    Y(:,i)=Y(:,i-1)+h./6.*(k1+2.*k2+2.*k3+k4);
end
end