function[sigma,G,R]=Diagonalisation(B) 
%algorithme de diagonalisation de matrice bidiagonale
%sortie Sigma diagonale et G et R telles que B=G*Sigma*R' 
[n,m]=size(B);
Bi=B;
In=eye(n);
Im=eye(m);
prec=10;
G=Im;
R=In;
eps=10^-6;
k=0;
kmax=2000;
err=1;
while err>eps && k<kmax
    for i=1:m-1
        vi=B(i,:)';
        Gv=Givens(vi,i,i+1);
        B=B*Gv';
        G=G*Gv';
    end
     for j=1:m-1
        uj=B(:,j);
        Ru=Givens(uj,j,j+1);
        B=Ru*B;
        R=R*Ru';
     end
     err=norm(triu(B,1),'fro'); %test de convergence: B tri sup (B initialmt
                                   % tri inf)==B diag
     k=k+1;
end
k %nb d'iters
sigma=B;
err_Su=norm(triu(sigma,1),'fro')
err_Sl=norm(tril(sigma,-1),'fro')
err_B=norm(R*B*G'-Bi)

end