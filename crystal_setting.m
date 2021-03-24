
%%%%% Orthorhombic unit cell %%%%%%
%%%%% underdoped YBa2Cu3O6+d single crystal case %%%%
a = 7.55186; % A
b = 3.81058; % A
c = 11.49652; % A

d = 1/sqrt(h^2/a^2 + k^2/b^2 + l^2/c^2);
G = 2*pi/d;
th = asin(lambda/2/d);

Ghkl = [2*pi/a*h 2*pi/b*k 2*pi/c*l];
Ghkl_n = Ghkl/norm(Ghkl);
Ghkl_th = atan(sqrt(Ghkl_n(1)^2 + Ghkl_n(2)^2)/Ghkl_n(3)); 
Ghkl_phi = atan(Ghkl_n(2)/Ghkl_n(1));

xaxis = [1 0 0];
yaxis = [0 1 0];
zaxis = [0 0 1];
