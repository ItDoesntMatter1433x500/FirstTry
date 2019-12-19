clear all;
close all;
clc;

x0=[0 200 0];
options=optimset('Display', 'iter');

fsolve(@DZ1,x0,options)