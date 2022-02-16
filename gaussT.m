function [x]=gaussT(A,b) 
  [n,m]=size(A);
  ordre=linspace(1,n,n); %vecteur qu'on va utiliser pour reordonner les composantes du vecteur resulta
  %pivot
  for k=1:n-1
    mx=abs(A(k,k));
    p=k;
    q=k;
    for i=k:n
      for j=k:n
        if (abs(A(i,j)>mx))
          mx=A(i,j);
          p=i;
          q=j;
        end
      end
    end
    %on permute les lignes
    for j=1:n
      perm=A(k,j);
      A(k,j)=A(p,j);
      A(p,j)=perm;
    end
    %on permute les colonnes 
    for i=1:n
      perm=A(i,k);
      A(i,k)=A(i,q);
      A(i,q)=perm;
    end
    %permutation de vecteur b
    perm=b(k);
    b(k)=b(p);
    b(p)=perm;
    %sauvegarde de l'odre
    perm=ordre(k);
    ordre(k)=ordre(q);
    ordre(q)=perm;
    %pivot
    pivot=A(k,k);
    for i=k+1:n
      coef=A(i,k)/pivot;
      for j=k:n
        A(i,j)=A(i,j)-coef*A(k,j);
      end
      b(i)=b(i)-coef*b(k);
    end
  end

  x(ordre(n))=b(n)/A(n,n);
  for i=n-1:-1:1
    somme=0;
    for j=i+1:n
      somme=somme+A(i,j)*x(ordre(j));
      x(ordre(i))=(b(i)-somme)/A(i,i);
    end
  end
  
