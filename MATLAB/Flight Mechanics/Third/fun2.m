function dydt=fun2(t,y)

dydt=zeros(4,1);

% система уравнений (8)
dydt(1)=y(2);
dydt(2)=-0.0017589/600*y(1)-0.2097/600*y(4);    %(-H*y(4)-kgamma*y(1))/Jx
dydt(3)=y(4);
dydt(4)=-0.00021987/400*y(3)+0.2097/400*y(2);   %(H*y(2)-kksi*y(3))/Jy

end

