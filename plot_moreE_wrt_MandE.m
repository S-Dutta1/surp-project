function plot_moreE_wrt_MandE()
hbar=(6.626/(2*pi))*10^-34;
syms E a prob;
V=input('Enter barrier potential in eV\n');
m=input('Enter mass in kg\n');
V=V*1.6*10^-19;
k2=(sqrt(2*m*(E-V)))/hbar;
t=1+V*V*sin(k2*a)*sin(k2*a)/(4*E*(E-V));
prob=1/t;
ezsurf(prob,[5*1.6e-19,10*1.6e-19,1e-9,2e-9])
end