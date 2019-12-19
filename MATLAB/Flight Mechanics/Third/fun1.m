function dxdt=fun1(t, x)

dxdt=zeros(2,1);

% уравнение (6)
dxdt(1)=x(2);
dxdt(2)=-0.00065960347192689780927844237080544*x(1)/800; %-kteta*x(1)/Jz

end

