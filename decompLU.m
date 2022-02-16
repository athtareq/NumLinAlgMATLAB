function [L,U]=decompLU(A)
  %fonction qui donne decomposition LU d'une matrice
  %carree A t.q A=LU
  [n,m]=size(A); %taille de A 
  L=eye(n); %initialisation de L par matrice Identite In
  Ai=A; %sauvegarde de la mtrice A pour tester ulterieurement

  
  %algorithme de la decomposition LU
  for k=1:n    
  P=eye(n); Q=eye(n);  
    for i=k+1:n
      P(i,k)=(-A(i,k)/A(k,k));
      Q(i,k)=A(i,k)/A(k,k);
    end
    A=P*A; L=L*Q;
  end
  U=A;
%test d'erreurs  
err_U=norm(tril(U,-1),'fro') %U matrice sup
err_A=norm(L*U-Ai) %A=L*U
err_L=norm(triu(L,1),'fro') %L matrice inf   
      
  
  
