openfemm
opendocument('kuvvetdeneme.FEM');
mi_saveas('temp.FEM');
n=10;
stroke=3;
x=zeros(n,1); 
f=zeros(n,1);
lololey=zeros(n,1);
for k=2:n
    disp(sprintf('iteration %i of %i',k,n));
    mi_analyze;
    mi_loadsolution;
    mo_groupselectblock(1);
    x(k)=stroke*(k-1)/(n-1);
    lololey(k)= mo_blockintegral(17);
    f(k)=(lololey(k)-lololey(k-1))/(x(k)-x(k-1));
    mi_selectgroup(1);
    mi_movetranslate(-stroke,0);
    mi_clearselected
end

plot(x,f)
xlabel('Displacement, cm');
ylabel('Force, N');
title('Plunger Force vs. Displacement');
