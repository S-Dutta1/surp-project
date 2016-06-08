function trapez_Tmat_plot()
hbar=(6.626e-34)/(2*pi);
fprintf('Potential is of the form V(x)=V0+sx starting at x=0\n');
V0=input('Enter V0 in eV\n');
V0=V0*1.6e-19;
s=input('Enter slope s\n');
s=s*1e-10;  % this is to maintain order of V
l=input('Enter width of trapezoidal barrier in nm\n');
l=l*1e-9;
m=9.1e-31;
n=100;%parts in which barrier has been divided
div=l/n;%d=each small division the barrier is divided into
E=[200];prob=[200];j=1;
for g=0:0.01:2
    E(j)=g*1.6e-19;
    k1=(sqrt(2*m*E(j)))/hbar;
    k2=(sqrt(2*m*(E(j)-V0)))/hbar;
    T=[1 0;0 1];
for i=0:1:n-1
    d=i*div;
    T=T*[exp(1i*k1*d) 0;0 exp(-1i*k1*d)]*0.5*[k1/k2+1 1-k1/k2;1-k1/k2 1+k1/k2]*[exp(-1i*k2*d) 0;0 exp(1i*k2*d)];
    k1=k2;
    k2=(sqrt(2*m*(E(j)-V0-s*(d+div))))/hbar;
end
k2=sqrt(2*m*E(j))/hbar;
d=l;
T=T*[exp(1i*k1*d) 0;0 exp(-1i*k1*d)]*0.5*[k1/k2+1 1-k1/k2;1-k1/k2 1+k1/k2]*[exp(-1i*k2*d) 0;0 exp(1i*k2*d)];
trans=det(T)/T(4);
prob(j)=(abs(trans))^2;
j=j+1;
end
plot(E/1.6e-19,log(prob));
end

