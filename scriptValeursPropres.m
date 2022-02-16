%Ce script teste QRFrancis donc aussi mon_Hessenberg et QRHessenberg  

  A=[1 5 3 2;5 12 0 1;0 8 1 4;3 2 9 1]
  [n,m]=size(A);
  [P,T]=QRFrancis(A);
  for i=1:n spec(i)=T(i,i); end
  spec
    
