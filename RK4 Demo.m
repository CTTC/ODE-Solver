clear all;clc;
% Exercise(a):
disp('Exercise(a):');
u01_1=-1;
u01_2=0;
u01=[u01_1;u01_2];
a1=0;
b1=1;
h=0.1;
udot1=@(t,u)[u(1)-u(2)+2;-u(1)+u(2)+4*t];
[T1,U1]=RK4(udot1,a1,b1,u01,h)
u1=@(t)[-1/2.*exp(2.*t)+t.^2+2.*t-1/2;1/2*exp(2.*t)+t.^2-1/2];
ureal1=u1(T1)
disp('The solution obtained by RK4 is:');
[t1,u1]=ode45(udot1,[a1 b1],u01)
disp('The solution obtained by ode45 is:');
figure(1);
plot(T1,U1(1,:),'r');
hold on;
plot(t1,u1(:,1),'g');
plot(T1,ureal1(1,:),'b');
legend('RK4','ode45','actual values');
title('u1');
figure(2);
plot(T1,U1(2,:),'r');
hold on;
plot(t1,u1(:,2),'g');
plot(T1,ureal1(2,:),'b');
title('u2');
legend('RK4','ode45','actual values');
% Exercise(b):
disp('Exercise(b):');
u02_1=-3;
u02_2=5;
u02=[u02_1;u02_2];
a2=0;
b2=2;
h=0.2;
udot2=@(t,u)[u(1)./9-2/3.*u(2)-1./9.*t.^2+2/3;u(2)+3.*t-4];
[T2,U2]=RK4(udot2,a2,b2,u02,h);
u2=@(t)[-3.*exp(t)+t.^2;4*exp(t)-3.*t+1];
ureal2=u2(T2);
disp('The solution obtained by RK4 is:');
T2
U2
ureal2
[t2,u2]=ode45(udot2,[a2 b2],u02);
disp('The solution obtained by ode45 is:');
t2
u2
figure(3);
plot(T2,U2(1,:),'r');
hold on;
plot(t2,u2(:,1),'g');
plot(T2,ureal2(1,:),'b');
title('u1');
legend('RK4','ode45','actual values');
figure(4);
plot(T2,U2(2,:),'r');
hold on;
plot(t2,u2(:,2),'g');
plot(T2,ureal2(2,:),'b');
title('u2');
legend('RK4','ode45','actual values');
