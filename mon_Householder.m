function [Q,R]=mon_Householder(A)
  %factorisation QR de Householder
Ai=A;  
[n,m]=size(A);
I=eye(n);
Q=eye(n);
%algorithme de HH
for k=1:m
    u=A(:,k); 
    for i=1:k-1 
      u(i)=0;
    end
    v=u+sign(u(k))*norm(u)*I(:,k); 
    v=v/norm(v); %vect Householder
    H=I-2*v*v'; %matrice householder
    A=H*A;
    Q=Q*H;
  end
R=A;
err_q=norm(Q'*Q-eye(n),'fro') %Q orthogonale
err_A=norm(Q*R-Ai)%A=QR
err_R=norm(tril(R,-1),'fro') %R tri inf
end
