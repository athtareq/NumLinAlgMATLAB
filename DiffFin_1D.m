function [U]=DiffFin_1D(a,b,c1,c2,n,f)
  %resolution de laplacien en dimension 1
  % -u''(x)=f(x);u(a)=c1;u(b)=c2;
  A=zeros(n);
  for i=2:n
    for j=i-1:i
      A(i,j)=-1;
      A(j,i)=-1;
    end
  end
  for i=1:n
    A(i,i)=2;
  end
  A;
  h=(b-a)/(n+1)
  x=linspace(a,b,n)
  func=f;
  bh(1)=h^2*feval(func,x(1))+c1;
  for i=2:n-1
    bh(i)=h^2*feval(func,x(i)); %feval evalue la fonction passee par nom f
  end
  bh(n)=h^2*feval(func,x(n))+c2;
  bh;
  U=gaussT(A,bh);
  
      
  
  
  
      
  
  