%Jacob Letterman
%10/1/2021
%BME 243
clc;
clear;
close all;

m=uigetfile('*.csv')
d1=readmatrix(m);
D=d1(:,3);
F=d1(:,2);

plot(D,F)
hold on
title('Force vs. Displacement')
xlabel('Displacement in mm')
ylabel('Force in N')
hold off

disp('Please select the rightmost point if the linear region')
[x2,y2]=ginput(1)
disp('Please select the leftmost point of the linear region')
[x1,y1]=ginput(2)

slope=((y2-y1)/(x2-x1));
stiffness=slope;
[y_max, index] = max(F); 
x_max = D(index);

area_RT=2.08;
area_LT=1.8;
area_RF=2.73;
area_LF=2.4;
length_RT=1.6;
length_LT=2.1;
length_RF=1.8;
length_LF=2;

ult_f=y_max;
ult_d=x_max;
ult_ss=y_max/area_RT;%LF can be replaced with the other bones
ult_st=x_max/length_RT;
els=ult_ss/ult_st;
fail_ss=y2/area_RT;
fail_st=x2/length_RT;

Name=["Ultimate Force";"Ultimate Displacement";"Ultimate Stress";"Ultimte Strain";"Stiffness"];
Numbers=[ult_f;ult_d;ult_ss;ult_st;stiffness];
Ult_1=table(Name,Numbers)

Name_2=["Failure Force";"Failure Displacement";"Failure Stress";"Failure Strain";"Elastic Modulus"];
Numbers_2=[y2;x2;fail_ss;fail_st;els];
Ult_2=table(Name_2,Numbers_2)