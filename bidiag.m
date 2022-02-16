function [P,B,H]=bidiag(A)
  %bidiagonalisation d'une matrice A
  %sortie: P othogonale, B bidagonale et H telles que A=HBP'
  [n,m]=size(A);
  Ai=A;
  In=eye(n);
  Im=eye(m);  
  P=Im;
  H=In;
  %algorithme de bidag
  for j=1:m
    u=A(:,j);
    for k=1:j-1
      u(k)=0;
    end
    v=u+sign(u(j))*norm(u)*In(:,j);
    v=v/norm(v);
    Hv=In-2*v*v';
    A=Hv*A;
    H=H*Hv;
    if(j<m-1)
    u=A(j,:)';
    for k=1:j
      u(k)=0;
    end
    v=u+sign(u(j+1))*norm(u)*Im(:,j+1);
    v=v/norm(v);
    Pv=Im-2*v*v';
    A=A*Pv';
    P=P*Pv;
  end
end
B=A;
%tests
err_A=norm(H*B*P'-Ai)
err_B=norm(tril(B,-1),'fro')  
err_P=norm(P'*P-eye(m),'fro')


