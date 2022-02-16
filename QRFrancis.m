%Ceci est une fonction qui calcule
%les valeurs propres de A
function [P,T]=QRFrancis(A)
  %Entree:matrice A de taille n,n
  %Sortie:T dont la diagonale contient les v.p de A
  %       P telle que A=P*T*P'
     
  [n,m]=size(A);
  Ai=A;
  eps=10^-6;  
  k=0;
  kmax=1000;
  err=1;
  [P,H]=mon_Hessenberg(A);
  %convergence
  while err>eps && k<kmax
   [Q,R]=QRHessenberg(H);
   H=R*Q;
   P=P*Q;                          
   err=norm(tril(H,-1),'fro'); %test de convergence: H triang inf
   k=k+1;   
  end  
%convergence de H vers T   
T=H;
k %nb d'iters
err_A=norm(P*T*P'-Ai);
err_q=norm(P'*P-eye(n),'fro')

