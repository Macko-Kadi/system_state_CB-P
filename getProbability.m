%zwraca wartosc prawdopodobienstwa przejscia miedzy stanami (1 szczelina)
%kolejka 1: zmiana stanu z n do k
%kolejka 2: zmiana stanu z m do l
%B1, B2 - pojemności buforów, l1, l2 - intensywności napływu
%AV: 1 - wyższy, 2 - niższy priorytet
%napływ zgodny z poisson
function p=getProbability(n,m,k,l,B1,B2,l1, l2,AV)
    if AV==1
        if n>0
            nx=n-1;
            mx=m;
        end
        if n==0
            if m>0
                nx=0;
                mx=m-1;
            end
            if m==0
                 nx=0;
                 mx=0;
            end
        end
    end
    if AV==2
        if m>0
            nx=n;
            mx=m-1;
        end
        if m==0
            if n>0
                nx=n-1;
                mx=0;
            end
            if n==0
                 nx=0;
                 mx=0;
            end
        end
    end
    if k-nx<0 || l-mx<0
        p=0;
    else
        if k<B1
            pA=poisspdf(k-nx,l1);
        end
        if k==B1
            pA=1-poisscdf(k-nx-1,l1);
        end
        if k>B1
            alert='ERROR: getProbability - k>B1'
        end
        if l<B2
            pV=poisspdf(l-mx,l2);
        end
        if l==B2
            pV=1-poisscdf(l-mx-1,l2);
        end
        if l>B2
            alert='ERROR: getProbability - l>B2'
        end
        p=pA*pV;
    end
end