clear;clear All;
syms x k L n;
f=sin(x);
evalin(symengine,'assume(k,Type::Integer)');
a = @(f,x,k,L) int(f*cos(k*pi*x/L)/L,x,-L,L);
b = @(f,x,k,L) int(f*sin(k*pi*x/L)/L,x,-L,L);
fs = @(f,x,n,L) a(f,x,0,L)/2 + ...
    symsum(a(f,x,k,L)*cos(k*pi*x/L) + b(f,x,k,L)*sin(k*pi*x/L),k,1,n);
pretty(fs(f,x,10,1));

figure; 
for count=1:1:15
    ezplot(fs(f,x,count,1),-1,1)
    hold on
    ezplot(f,-1,1);
    hold off
    pause(.5);
end
%hold off
%title('Partial sum with n=2')