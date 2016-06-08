function trapez_WKB_plot()
hbar=(6.626e-34)/(2*pi);
fprintf('Potential is of the form V(x)=V0+sx starting at x=0\n');
V0=input('Enter V0 in eV\n');
V0=V0*1.6e-19;
s=input('Enter slope s\n');
s=s*1.6e-10;  % this is to maintain order of V
l=input('Enter width of trapezoidal barrier in nm\n');
l=l*1e-9;
m=9.1e-31;
E=[200];trans=[200];j=1;
syms x;
for g=0:0.01:2
    E(j)=g*1.6e-19;
    p=(2/3)*((V0+s*l-E(j))^1.5-(V0-E(j))^1.5)*sqrt(2*m)/hbar/s;
    %p=double(int(sqrt(V0+s*x-E),0,l))*sqrt(2*m)/hbar;
    prob=exp(-2*p);
    trans(j)=prob/(1+.25*prob)^2;
    j=j+1;
end
plot(E/1.6e-19,log(trans));
end

    