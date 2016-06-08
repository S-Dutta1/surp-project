function trape_WKB_io()
hbar=(6.626e-34)/(2*pi);
fprintf('Potential is of the form V(x)=V0+s*x starting at x=0\n');
V0=input('Enter V0 in eV\n');
V0=V0*1.6e-19;
s=input('Enter slope s\n');
s=s*1.6e-19;% this is to maintain order of V
l=input('Enter width of trapezoidal barrier l in nm\n');
l=l*1e-9;
%syms x;
E=input('Enter energy in eV\n');
E=E*1.6e-19;
m=9.1e-31;
syms x;
%p=double(int(sqrt(V0+s*x/l-E)))*sqrt(2*m/hbar);
p=double(int(sqrt(V0+s*x-E),0,l))*sqrt(2*m)/hbar;
prob=exp(-2*p);
trans=prob/(1+.25*prob)^2;
fprintf('Probability is %d\n',trans);
end
