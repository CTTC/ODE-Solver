clear all;clc;
syms y(t) t
display('The solution of y''=t+y is that:');
y_solution1=dsolve(diff(y)==t+y,y(0)==0)
display('The solution of y''=t-y is that:');
y_solution2=dsolve(diff(y)==t-y,y(0)==0)
yexact1=matlabFunction(y_solution1);
yexact2=matlabFunction(y_solution2);

%The explicit trapezoid Method
a=0;
b=1;
y0=0;
ydot1=@(t,y)t+y;
ydot2=@(t,y)t-y;
h=0.1;
T=a:h:b;
disp('For y''=t+y');
[T11,Y11]=TraperzoidODE(ydot1,a,b,y0,h,yexact1(T));
disp('For y''=t-y');
[T21,Y21]=TraperzoidODE(ydot2,a,b,y0,h,yexact2(T));

%Error
k=0:5;
h=0.1.*2.^(-k);
y1=yexact1(1);
y2=yexact2(1);
error1=zeros(length(k));
error2=zeros(length(k));
for i=1:length(k)
    T=a:h(i):b;
    [T1,Y1]=TraperzoidODE(ydot1,a,b,y0,h(i),yexact1(T));
    [T2,Y2]=TraperzoidODE(ydot2,a,b,y0,h(i),yexact2(T));
    error1(i)=y1-Y1(end);
    error2(i)=y2-Y2(end);
end
figure(1);
loglog(h,error1,'o-','MarkerFaceColor','r','MarkerSize',8);
hold on;
loglog(h,error2,'o-','MarkerFaceColor','g','MarkerSize',8);
title('Error Plot');
legend('The error plot for y''=t+y','The error plot for y''=t-y');
xlabel('h');
ylabel('Error');



