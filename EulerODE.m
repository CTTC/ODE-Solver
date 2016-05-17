function [T,Y]=EulerODE(ydot,a,b,y0,h)
%Input -ydot is the first order derivative function which is an anonymous
%       function.The first variable is t and the second variable is y
%       -a and b are the left and right end points
%       -y0 is the initial condition
%       -h is the step size
%Output -T is th vector of abscissas
%       -Y is the vector of ordinates
T=a:h:b;
m=length(T);
Y=zeros(1,m);
Y(1)=y0;
for i=2:m
    Y(i)=Y(i-1)+h*ydot(T(i-1),Y(i-1));
end
end

