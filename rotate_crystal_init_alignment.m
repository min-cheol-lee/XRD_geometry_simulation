
sam_chi = atan(sqrt(surface_lab(1).^2+ surface_lab(2).^2)/surface_lab(3));
sam_chi_deg = sam_chi*180/pi;
sam_omega = atan((surface_lab(2)/surface_lab(1)));


M_R_th = [1 0 0,
          0 cos(pi/2-sam_chi) -sin(pi/2-sam_chi),
          0 sin(pi/2-sam_chi) cos(pi/2-sam_chi)];
      
M_R_phi = [cos(pi/2+sam_omega) sin(pi/2+sam_omega) 0,
          -sin(pi/2+sam_omega) cos(pi/2+sam_omega) 0,
          0 0 1];
      
M_R_total = mtimes(M_R_th,M_R_phi);      
vert_init = mtimes(M_R_total,vert_lab.').';  
sam_b_init = mtimes(M_R_total,sam_b_lab);  
sam_c_init = mtimes(M_R_total,sam_c_lab);  

vec_sam_b_init(1,:) = [0 0 0];
vec_sam_b_init(2,:) = sam_b_init;
vec_sam_c_init(1,:) = [0 0 0];
vec_sam_c_init(2,:) = sam_c_init;
