%ce script teste les resolutions par diff finie
%la solution exacte est u=sin(x)
[U]=DiffFin_1D(0,2*pi,0,0,100,'sin'); 
%[u]=DiffFinies_expl(n,c,T,c1,c2,u0)
%[u]=DiffFin_impli(n,c,T,u0)
x=linspace(0,2*pi,100);
y=sin(x);
plot(x,y,x,U,'+') %on plot pour voir la difference avec sol exacte 
err=norm(U-y)