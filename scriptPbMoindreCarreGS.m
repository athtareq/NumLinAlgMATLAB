%ce script resout un pb en moindres carres avec QR GS 
%Le prob est x*=argmin||b-Ax|| b=(1 1 1 ... 1) pour simplicite
%prbleme revient a resoudre Rchap*x=bchap=Qt'*b(:,1:m)
n=5;m=4;
A=rand(n,m);
b=A*ones(m,1);
[Q,R]=mon_GS(A) %QQ'!=In mais Rchap=R
Qchap=Q(:,n-m); 
Qt=[Q,Qchap]%on complete Q par Qchap pour avoir matrice de nxn
bc=Qt'*b;
bchap=bc(1:m);
% R tri inf donc on resout par remonte 
X=remonte(R,bchap) %x*=X
