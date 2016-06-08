function formula_double_barrier_io()
hbar=(6.626e-34)/(2*pi);
%a=input('first edge of first barrierin nm\n');
l1=input('width of first barrier in nm\n');
d=input('length of the well in nm\n');
l2=input('width of second barrier in nm\n');
l1=l1*1e-9;l2=l2*1e-9;d=d*1e-9;
V1=input('height of first barrier in eV\n');
V2=input('height of second barrier in eV\n');
V1=V1*1.6e-19;V2=V2*1.6e-19;
m=9.1e-31;
E=input('enter energy of electron in eV\n');
E=E*1.6e-19;
k=sqrt(2*m*E/(hbar^2));
b1=sqrt(2*m*(V1-E)/(hbar^2));
b2=sqrt(2*m*(V2-E)/(hbar^2));
M1=0.5*(b1/k+k/b1);M2=0.5*(b2/k+k/b2);
K1=0.5*(b1/k-k/b1);K2=0.5*(b2/k-k/b2);
T=exp(1i*k*d)*M1*sinh(b1*l1)*M2*sinh(b2*l2)+exp(-1i*k*d)*(cosh(b1*l1)+1i*K1*sinh(b1*l1))*(cosh(b2*l2)+1i*K2*sinh(b2*l2));
prob=1/((abs(T))^2);
fprintf('Tunneling Probalility is %d\n',prob);
end
