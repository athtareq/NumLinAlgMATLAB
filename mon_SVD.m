function [U,sigma,V]=mon_SVD(A) 
  Ai=A;
  %decomposition svd de A telle que A=U*SIGMA*V'
  [P,B,H]=bidiag(A);
  [sigma,G,R]=Diagonalisation(B);
  U=H*R;
  V=P*G;
  err_A=norm(U*sigma*V'-Ai);