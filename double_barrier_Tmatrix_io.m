function double_barrier_Tmatrix_io()
hbar=(6.626e-34)/(2*pi);
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
k1=(sqrt(2*m*E))/hbar;
k2=(sqrt(2*m*(E-V1)))/hbar;
k3=(sqrt(2*m*(E-V2)))/hbar;
m1=0.5*[k1/k2+1 1-k1/k2;1-k1/k2 1+k1/k2];
m2=0.5*[1+k2/k1 1-k2/k1;1-k2/k1 1+k2/k1];
m3=0.5*[k1/k3+1 1-k1/k3;1-k1/k3 1+k1/k3];
m4=0.5*[1+k3/k1 1-k3/k1;1-k3/k1 1+k3/k1];
T=m1*[exp(1i*k2*l1) 0;0 exp(-1i*k2*l1)]*m2*[exp(-1i*k1*l1) 0;0 exp(1i*k1*l1)];
T=T*[exp(1i*k1*(l1+d)) 0;0 exp(-1i*k1*(l1+d))]*m3*[exp(-1i*k3*(l1+d)) 0;0 exp(1i*k3*(l1+d))];
T=T*[exp(1i*k3*(l1+l2+d)) 0;0 exp(-1i*k3*(l1+l2+d))]*m4*[exp(-1i*k1*(l1+l2+d)) 0;0 exp(1i*k1*(l1+d+l2))];
trans=det(T)/T(4);
prob=(abs(trans))^2;
fprintf('Probability is %d\n',prob);