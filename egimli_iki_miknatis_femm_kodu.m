openfemm
opendocument('magnets.FEM');
mi_saveas('temp.FEM');
n=20;

x=zeros(n,1);
y=zeros(n,1);
fx=zeros(n,1);
fx=zeros(n,1);
ax=zeros(n,1);
ay=zeros(n,1);
vx=zeros(n,1);
vy=zeros(n,1);
mass=5; %kg


for t=2:n
    disp(sprintf('iteration %i of %i',t,n));
    mi_analyze;
    mi_loadsolution;
    mo_groupselectblock(1);
    fx(t)=mo_blockintegral(18);
    fy(t)=mo_blockintegral(19);
    ax(t)=fx(t)/mass;
    ay(t)=fy(t)/mass;
    vx(t)=vx(t-1)+ax(t);
    vy(t)=vy(t-1)+ay(t);
    x(t)=x(t-1)+vx(t);
    y(t)=y(t-1)+vy(t);
    mi_selectgroup(1);
    mi_movetranslate(x(t),y(t));
    
    mi_clearselected
end


