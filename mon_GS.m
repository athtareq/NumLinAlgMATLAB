function [Q,R]=mon_GS(A)
  %factoriasation gram schmidt 
[n,m]=size(A);Q=zeros(n,m);R=zeros(m,m); %initialisation 
for k=1:m
    w=A(:,k); %on utilise gram schmidt modifiee pour eviter les err d'arrondi
    for i=1:k-1
        R(i,k)=w'*Q(:,i);
        w=w-R(i,k)*Q(:,i);
    end
    R(k,k)=norm(w);
    Q(:,k)=w/R(k,k);
  end
err_q=norm(Q'*Q-eye(m),'fro') %test Q orthogonale
err_A=norm(Q*R-A) %test A=QR 
%R tri inf par definition
end


