function [u]=DiffFinies_expl(n,c,T,c1,c2,u0)
  %resolution par schema implicite d'equation temporelle  
  h=1/(n+1); 
  dt=T/(n+1);
%en connaissant u(i+1) et u(i-1) on trouve la solution
  u=u0;  
  u(1)=c1; 
  u(n)=c2;
  for i=2:n-1
      u(i)=u(i)+(dt*c/h^(2)).*(u(i+1)-(2.*u(i))+u(i-1));
  end
  end