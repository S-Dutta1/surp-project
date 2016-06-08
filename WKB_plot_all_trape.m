function WKB_plot_all_trape()
hbar=(6.626e-34)/(2*pi);
fprintf('Potential is of the form V(x)=V0+sx starting at x=0\n');
V0=input('Enter V0 in eV\n');
V0=V0*1.6e-19;
s=input('Enter slope s\n');
s=s*1.6e-10;  % this is to maintain order of V
l=input('Enter width of trapezoidal barrier in nm\n');
l=l*1e-9;
m=9.1e-31;
V1=V0+s*l;
E=[400];trans=[400];j=1;
%syms x;
for g=0:0.01:4
    E(j)=g*1.6e-19;
    if(E(j)<=V0&&E(j)<=V1)
        p=(2/3)*((V0+s*l-E(j))^1.5-(V0-E(j))^1.5)*sqrt(2*m)/hbar/s;
    %p=double(int(sqrt(V0+s*x-E),0,l))*sqrt(2*m)/hbar;
    elseif(E(j)>=V0&&E(j)<V1)
        %x=(E(j)-V0)/s;
        p=(2/3)*((V1-E(j))^1.5)*sqrt(2*m)/hbar/s;
    elseif(E(j)<V0&&E(j)>V1)
        %x=(E(j)-V0)/s;
        p=(2/3)*((V0-E(j))^1.5)*sqrt(2*m)/hbar/s;
    end    
    prob=exp(-2*p);
    trans(j)=prob/(1+.25*prob)^2;
    j=j+1;
end
plot(E/1.6e-19,trans);
end