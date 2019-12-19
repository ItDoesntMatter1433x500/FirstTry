function [ t ] = VAK( DD2, MM2, YYYY2, DD1, MM1, YYYY1 )

if (MM2 == 1) || (MM2 == 2)
    F=365*YYYY2+DD2+31*(MM2)+fix(YYYY2/4)-fix(0.75*fix(YYYY2/100)+1);
else
    F=365*YYYY2+DD2+31*(MM2)-fix(0.4*MM2+2.3)+fix(YYYY2/4)-fix(0.75*fix(YYYY2/100)+1);
end 

if (MM1 == 1) || (MM1 == 2)
    Fv=365*YYYY1+DD1+31*(MM1)+fix(YYYY1/4)-fix(0.75*fix(YYYY1/100)+1);
else
    Fv=365*YYYY1+DD1+31*(MM1)-fix(0.4*MM1+2.3)+fix(YYYY1/4)-fix(0.75*fix(YYYY1/100)+1);
end 

t=F-Fv;

end


