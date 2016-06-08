function tunnel_io()
hbar=(6.626/(2*pi))*10^-34;
E=0;V=0;m=0;a=0;k1=0;k2=0;prob=0;
E=input('Enter energy in eV\n');
V=input('Enter barrier potential in eV\n');
m=input('Enter mass in kg\n');
a=input('Enter barrier width in nm\n');
E=E*1.6*10^-19;
V=V*1.6*10^-19; 
a=a*10^-9;
if(E<=V)
    k1=(sqrt(2*m*E))/hbar;
    k2=(sqrt(2*m*(V-E)))/hbar;
    t=1+V*V*sinh(k2*a)*sinh(k2*a)/(4*E*(V-E));
    prob=1/t;
else
    k2=(sqrt(2*m*(E-V)))/hbar;
    t=1+V*V*sin(k2*a)*sin(k2*a)/(4*E*(E-V));
    prob=1/t;
end
fprintf('Tunneling probability is %d\n',prob);
end
