clear all;clc;
syms y(t) t
display('The solution of y''=t+y is that:');
y_solution1=dsolve(diff(y)==t+y,y(0)==0)
display('The solution of y''=t-y is that:');
y_solution2=dsolve(diff(y)==t-y,y(0)==0)
yexact1=matlabFunction(y_solution1);
yexact2=matlabFunction(y_solution2);

%Euler's Method
a=0;
b=1;
y0=0;
ydot1=@(t,y)t+y;
ydot2=@(t,y)t-y;
h=0.1;
[T11,Y11]=EulerODE(ydot1,a,b,y0,h);
[T21,Y21]=EulerODE(ydot2,a,b,y0,h);
h=0.05;
[T12,Y12]=EulerODE(ydot1,a,b,y0,h);
[T22,Y22]=EulerODE(ydot2,a,b,y0,h);
h=0.025;
[T13,Y13]=EulerODE(ydot1,a,b,y0,h);
[T23,Y23]=EulerODE(ydot2,a,b,y0,h);
figure(1);
plot(T11,yexact1(T11),'o-','MarkerFaceColor','g','MarkerSize',5);
hold on;
plot(T11,Y11,'o-','MarkerFaceColor','r','MarkerSize',5);
title('y''=t+y with step size=0.1')
legend('The exact Solution points','The Euler''s Method''s Solution points');
xlabel('t');
ylabel('y');
figure(2);
plot(T21,yexact1(T21),'o-','MarkerFaceColor','g','MarkerSize',5);
hold on;
plot(T21,Y21,'o-','MarkerFaceColor','r','MarkerSize',5);
title('y''=t-y with step size=0.1')
legend('The exact Solution points','The Euler''s Method''s Solution points');
xlabel('t');
ylabel('y');
figure(3);
plot(T12,yexact1(T12),'o-','MarkerFaceColor','g','MarkerSize',5);
hold on;
plot(T12,Y12,'o-','MarkerFaceColor','r','MarkerSize',5);
title('y''=t+y with step size=0.05')
legend('The exact Solution points','The Euler''s Method''s Solution points');
xlabel('t');
ylabel('y');
figure(4);
plot(T22,yexact1(T22),'o-','MarkerFaceColor','g','MarkerSize',5);
hold on;
plot(T22,Y22,'o-','MarkerFaceColor','r','MarkerSize',5);
title('y''=t-y with step size=0.05')
legend('The exact Solution points','The Euler''s Method''s Solution points');
xlabel('t');
ylabel('y');
figure(5);
plot(T13,yexact1(T13),'o-','MarkerFaceColor','g','MarkerSize',5);
hold on;
plot(T13,Y13,'o-','MarkerFaceColor','r','MarkerSize',5);
title('y''=t+y with step size=0.025')
legend('The exact Solution points','The Euler''s Method''s Solution points');
xlabel('t');
ylabel('y');
figure(6);
plot(T23,yexact1(T23),'o-','MarkerFaceColor','g','MarkerSize',5);
hold on;
plot(T23,Y23,'o-','MarkerFaceColor','r','MarkerSize',5);
title('y''=t-y with step size=0.025')
legend('The exact Solution points','The Euler''s Method''s Solution points');
xlabel('t');
ylabel('y');
%Error
k=0:5;
h=0.1.*2.^(-k);
y1=yexact1(1);
y2=yexact2(1);
error1=zeros(length(k));
error2=zeros(length(k));
for i=1:length(k)
    [T1,Y1]=EulerODE(ydot1,a,b,y0,h(i));
    [T2,Y2]=EulerODE(ydot2,a,b,y0,h(i));
    error1(i)=y1-Y1(end);
    error2(i)=y2-Y2(end);
end
figure(7);
loglog(h,error1,'o-','MarkerFaceColor','r','MarkerSize',8);
hold on;
loglog(h,error2,'o-','MarkerFaceColor','g','MarkerSize',8);
title('Error Plot');
legend('The error plot for y''=t+y','The error plot for y''=t-y');
xlabel('h');
ylabel('Error');


