function [Q,R]=QRHessenberg(A)
  [n,m]=size(A);
  Ai=A;
  I=eye(n);
  Q=I;
  [P,H]=mon_Hessenberg(A);
  Hi=H;
  for j=1:n-1
    u=H(:,j);
    a=u(j);b=u(j+1);
    ej=I(:,j);ejj=I(:,j+1);
    c=a/sqrt(a*a+b*b);s=b/sqrt(a*a+b*b);
    G=I+(c-1)*(ej*ej'+ejj*ejj')+s*(ej*ejj'-ejj*ej');
    H=G*H;
    Q=Q*G';
  end
  R=H;
err_q=norm(Q'*Q-I,'fro');
err_A=norm(Q*R-Hi,'fro');
err_R=norm(tril(R,-1),'fro');
