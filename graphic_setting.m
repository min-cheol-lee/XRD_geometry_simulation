% point number for simulation
N = 10000;

dev_angle = dev_angle_deg/180*pi;
alpha = alpha_deg/180*pi;

M_R_th = [cos(Ghkl_th) 0 sin(Ghkl_th),
          0 1 0,
          -sin(Ghkl_th) 0 cos(Ghkl_th)];
      
M_R_phi = [cos(Ghkl_phi) -sin(Ghkl_phi) 0,
          sin(Ghkl_phi) cos(Ghkl_phi) 0,
          0 0 1];
      

vec_Ghkl(1,:) = [0 0 0];
vec_Ghkl(2,:) = Ghkl_n;

vec_surface(1,:) = [0 0 0];
vec_surface(2,:) = surface/2;

vec_x(1,:) = [0 0 0];
vec_x(2,:) = xaxis;
vec_y(1,:) = [0 0 0];
vec_y(2,:) = yaxis;
vec_z(1,:) = [0 0 0];
vec_z(2,:) = zaxis;

thick = 0.1;
inp1 = 0.5;
inp2 = 0.5;

vert = [-thick -inp1 -inp2;  ...
        -thick inp1 -inp2;  ...
         0 inp1 -inp2;  ...
         0 -inp1 -inp2; ...
        -thick -inp1 inp2; ...
         -thick inp1 inp2;  ...
          0 inp1 inp2; ...
          0 -inp1 inp2];   

if surface == [0 1 0]
    switch_temp = vert(:,1);    
    vert(:,1) = vert(:,2);
    vert(:,2) = switch_temp;
    
 elseif surface == [0 0 1]
    switch_temp = vert(:,1);    
    vert(:,1) = vert(:,3);
    vert(:,3) = switch_temp;

end
      
fac = [1 2 3 4; ...
    2 6 7 3; ...
    4 3 7 8; ...
    1 5 8 4; ...
    1 2 6 5; ...
    5 6 7 8];

