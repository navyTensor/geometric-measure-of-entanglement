N=49;
E1(N)=0;
E2(N)=0;
s(N)=0;
lap(N)=0;

for i=1:1:N

    s(i)=(i)*0.02;

    X=state1(s(i),1);
    T=tensor(X);
    T=T./norm(T);
    decomp=tucker_als(T,1,'init','nvecs');
    
    lap(i)=decomp.lambda;
    %disp(lap)
    E1(i)=1-abs(lap(i))^2;
E2(i)=state1root(s(i));
end

plot(s,E1,'*',s,E1);
xlabel('s');
ylabel('Entanglement');
legend('Numerical','Theoretical');
title('Entanglement as a function of parameters s');