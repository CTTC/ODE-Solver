function [T,Y]=TraperzoidODE(ydot,a,b,y0,h,yreal)
%Input -ydot is the first order derivative function which is an anonymous
%       function.The first variable is t and the second variable is y
%       -a and b are the left and right end points
%       -y0 is the initial condition
%       -h is the step size
%       -yreal is the vector of y real values
%Output -T is th vector of abscissas
%       -Y is the vector of ordinates
disp('========================================');
disp('The table of t values,approximations and global truncation error');
disp('========================================');
T=a:h:b;
m=length(T);
Y=zeros(1,m);
Y(1)=y0;
globalerror=zeros(1,m);
globalerror(1)=Y(1)-yreal(1);
fprintf('Step 0: t=%2.1f; approximation=%8.7f; global trunction error=%8.7f\n',T(1),Y(1),globalerror(1));
for i=2:m
    k1=ydot(T(i-1),Y(i-1));
    k2=ydot(T(i),Y(i-1)+h*ydot(T(i-1),Y(i-1)));
    Y(i)=Y(i-1)+h/2*(k1+k2);
    globalerror(i)=Y(i)-yreal(i);
    fprintf('Step %i: t=%2.1f; approximation=%8.7f; global trunction error=%8.7f\n',i-1,T(i),Y(i),globalerror(i));
end
disp('========================================');
end