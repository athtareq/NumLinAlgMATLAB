%ce script teste la precision de la methode de gauss total gaussT 
clear all;
i=0;
for n=10:10:500
         i=i+1;
         A=fix(100*rand(n));
         b=A*ones(n,1);
         [x]=gaussT(A,b);
         err(i)=norm(b-A*x');
end
plot(err)
