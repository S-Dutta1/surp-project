function plot_tunnel()
hbar=(6.626/(2*pi))*10^-34;
%V=0;m=0;a=0;k1=0;k2=0;
%E=input('Enter energy in eV\n');
V=input('Enter barrier potential in eV\n');
m=input('Enter mass in kg\n');
a=input('Enter barrier width in nm\n');
V=V*1.6*10^-19; 
a=a*10^-9;
E=[100];prob=[100];i=1;
for g=0.1:0.1:10
    E(i)=g*1.6*10^-19;
if(E(i)<=V)
   % k1=(sqrt(2*m*E(i)))/hbar;
    k2=(sqrt(2*m*(V-E(i))))/hbar;
    t=1+V*V*sinh(k2*a)*sinh(k2*a)/(4*E(i)*(V-E(i)));
    prob(i)=1/t;
else
    k2=(sqrt(2*m*(E(i)-V)))/hbar;
    t=1+V*V*sin(k2*a)*sin(k2*a)/(4*E(i)*(E(i)-V));
    prob(i)=1/t;
end
i=i+1;
end
plot(E,prob);
end
