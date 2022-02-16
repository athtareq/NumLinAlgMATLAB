%ce script resout un pb en moindres carres avec QR GS 
%Le prob est x*=argmin||b-Ax|| avec b=(1 1 1 ... 1) pour simplicite
%prbleme revient a resoudre Rchap*x=bchap=Qt*b(:,1:m)
n=5;m=4;
A=rand(n,m)
b=A*ones(m,1);
[Q,R]=mon_Householder(A); %QQ'=In mais R de taille nxm
Rchap=R(1:m,1:m) %on utilise alors Rchap de mxm
bc=Q'*b;
bchap=bc(1:m);
% R tri inf donc on resout par remonte 
X=remonte(Rchap,bchap)%x*=X
