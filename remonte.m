function [x]=remonte(A,b)
  [n,m]=size(A);
  x(n)=b(n)/A(n,n);
  for i=n-1:-1:1
    somme=0;
    for j=i+1:n
      somme=somme+A(i,j)*x(j);
      x(i)=(b(i)-somme)/A(i,i);
    end
  end 
end
