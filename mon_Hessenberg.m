function [P,H]=mon_Hessenberg(A)
  %extraire matrice de Hessenberg telle que
  %P*H*P'=A
  [n,m]=size(A);
  if(n~=m) disp('erreur: n!=m'); end
  Ai=A;
  I=eye(n);
  P=I;
  H=A;
  for j=1:n-2
    u=H(:,j);
    for k=1:j
      u(k)=0;
    end
    v=u+sign(u(j+1))*norm(u)*I(:,j+1);
    v=v/norm(v);
    Pv=I-2*v*v';
    H=Pv*H*Pv';
    P=P*Pv;
  end
err_P=norm(P'*P-eye(n),'fro')
err_A=norm(P*H*P'-Ai)
err_H=norm(tril(H,-2),'fro')  


