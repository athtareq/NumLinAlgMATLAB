function [u]=DiffFin_impli(n,c,T,u0)
  %resolution par schema implicite d'equation temporelle
  %on resout un systeme AUn+1=Un en n etapes
  h=1/(n+1)
  dt=T/(n+1)
  cdh=c*dt/(h^2);
  %matrice A de diag 1+2cdh et surdiags -cdh
  A=zeros(n);
  for i=2:n
    for j=i-1:i
      A(i,j)=-cdh;
      A(j,i)=-cdh;
    end
  end
  for i=1:n
      A(i,i)=1+2*cdh;
  end
  A;
  %Un avec n=0 
  u=u0; 
  for i=0:n-1
    u=gaussT(A,u);
    i=i+1;
  end
  
    