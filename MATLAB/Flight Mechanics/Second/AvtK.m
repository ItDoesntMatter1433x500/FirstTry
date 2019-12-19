function [ DD, MM, YYYY ] = AvtK( DDv, MMv, YYYYv, t )


if (MMv == 1) || (MMv == 2)
    Fv=365*YYYYv+DDv+31*(MMv)+fix(YYYYv/4)-fix(0.75*fix(YYYYv/100)+1);
else
    Fv=365*YYYYv+DDv+31*(MMv)-fix(0.4*MMv+2.3)+fix(YYYYv/4)-fix(0.75*fix(YYYYv/100)+1);
end 

DD=DDv;
MM=MMv;
YYYY=YYYYv;
F=Fv;
dF=F-Fv;

while (dF ~= t)
    
    if (DD==31) && (MM==12)
        YYYY=YYYY+1;
        MM=1;
        DD=1;
    else       
        switch MM
            
            case {1, 3, 5, 7, 8, 10, 12}
                if (DD==31)
                    MM=MM+1;
                    DD=1;
                else
                    DD=DD+1;
                end
             
             case {4, 6, 9, 11}       
                if (DD==30)
                    MM=MM+1;
                    DD=1;
                else
                    DD=DD+1;
                end
                
            case 2
                if ((rem(YYYY,4)==0) && (rem(YYYY,100)~=0)) || (rem(YYYY,4)==400)
                    if (DD==29)
                      MM=MM+1;
                      DD=1;
                    else
                      DD=DD+1;
                    end
                else
                    if (DD==28)
                      MM=MM+1;
                      DD=1;
                    else
                      DD=DD+1;
                    end
                end       
                    
        end   
                      
    end  
   
    if (MM == 1) || (MM == 2)
        F=365*YYYY+DD+31*(MM)+fix(YYYY/4)-fix(0.75*fix(YYYY/100)+1);
    else
        F=365*YYYY+DD+31*(MM)-fix(0.4*MM+2.3)+fix(YYYY/4)-fix(0.75*fix(YYYY/100)+1);
    end 

    dF=F-Fv;
end

end


