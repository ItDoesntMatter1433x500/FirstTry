function dzdt=fun3(t,z)

dzdt=zeros(4,1);

% система уравнений (10)
dzdt(1)=z(2);
dzdt(2)=-0.5/600*z(2)-0.0017589/600*z(1)-0.2097/600*z(4);    %(-H*z(4)-kgamma*z(1)-Dx*z(2))/Jx
dzdt(3)=z(4);
dzdt(4)=-0.5/400*z(4)-0.00021987/400*z(3)+0.2097/400*z(2);   %(H*z(2)-kksi*z(3)-Dy*z(4))/Jy

end

