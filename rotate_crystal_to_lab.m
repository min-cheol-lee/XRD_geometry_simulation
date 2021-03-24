Xin_th = atan(sqrt(Xin_alpha(1)^2 + Xin_alpha(2)^2)/Xin_alpha(3)); 
Xin_phi = atan(Xin_alpha(2)/Xin_alpha(1));
Xin_th_deg = Xin_th*180/pi;
Xin_phi_deg = Xin_phi*180/pi;

M_R_th = [1 0 0,
          0 cos(pi/2-Xin_th) -sin(pi/2-Xin_th),
          0 sin(pi/2-Xin_th) cos(pi/2-Xin_th)];
      
M_R_phi = [cos(pi/2+Xin_phi) sin(pi/2+Xin_phi) 0,
          -sin(pi/2+Xin_phi) cos(pi/2+Xin_phi) 0,
          0 0 1];
      
Xout_lab_pre = mtimes(M_R_th,mtimes(M_R_phi,Xout_alpha.'));

if sign(Xout_lab_pre(1)) == 1 % ++-
    sign_opt_dev = -1;
    set_rot_angle = 0;
else
    sign_opt_dev = +1; % --- / -+-
    set_rot_angle = pi;
end

rot_angle = atan(Xout_lab_pre(3)/Xout_lab_pre(1));
rot_angle_eff = pi/2-rot_angle+set_rot_angle;


M_R_rot = [cos(rot_angle_eff) 0 -sin(rot_angle_eff),
           0 1 0,
           sin(rot_angle_eff) 0 cos(rot_angle_eff)];
            

Xout_lab = mtimes(M_R_rot,Xout_lab_pre);        
vec_Xout_lab(1,:) = [0 0 0];      
vec_Xout_lab(2,:) = Xout_lab;        
        
M_R_total = mtimes(M_R_rot,(mtimes(M_R_th,M_R_phi)));
      
      
Xin_lab = mtimes(M_R_total,Xin_alpha.');
vec_Xin_lab(1,:) = [0 0 0];      
vec_Xin_lab(2,:) = Xin_lab;


surface_lab = mtimes(M_R_total,surface.');  
Ghkl_lab = mtimes(M_R_total,Ghkl.');  

vec_surface_lab(1,:) = [0 0 0];      
vec_surface_lab(2,:) = surface_lab;
vec_Ghkl_lab(1,:) = [0 0 0];      
vec_Ghkl_lab(2,:) = Ghkl_lab;


sam_b_lab = mtimes(M_R_total,yaxis.');
sam_c_lab = mtimes(M_R_total,zaxis.');
vec_sam_b_lab(1,:) = [0 0 0];      
vec_sam_b_lab(2,:) = sam_b_lab/2;
vec_sam_c_lab(1,:) = [0 0 0];      
vec_sam_c_lab(2,:) = sam_c_lab/2;

dev_angle = sign_opt_dev*dev_angle;

M_R_dev = [cos(dev_angle) sin(dev_angle) 0,
        -sin(dev_angle) cos(dev_angle) 0,
        0 0 1];

optical = mtimes(M_R_dev,Xin_lab);

vec_optical(1,:) = [0 0 0];
vec_optical(2,:) = optical;

optical_vert = cross([0 0 1], optical);

sam_c_hor = dot(sam_c_lab,[0 0 1]);
sam_c_ver = dot(sam_c_lab,optical_vert);

sam_b_hor = dot(sam_b_lab,[0 0 1]);
sam_b_ver = dot(sam_b_lab,optical_vert);

pol_optical_c_axis = atan(sam_c_hor/sam_c_ver);


angle_optical_b_axis = atan(sam_b_hor/sam_b_ver);
angle_optical_b_axis_deg = angle_optical_b_axis * 180/pi;

optical_c = sin(pol_optical_c_axis)*[0 0 1] + cos(pol_optical_c_axis)*optical_vert;
optical_b = sin(pol_optical_c_axis-pi/2)*[0 0 1] + cos(pol_optical_c_axis-pi/2)*optical_vert;

vec_optical_c(1,:) = -optical_c.'/8 + optical*2/3;
vec_optical_c(2,:) = optical_c.'/8 + optical*2/3;
vec_optical_b(1,:) = -optical_b.'/8 + optical*2/3;
vec_optical_b(2,:) = optical_b.'/8 + optical*2/3;

vec_optical_vert(1,:) = [0 0 0].'+ optical*3/4;
vec_optical_vert(2,:) = optical_vert.'/4 + optical*3/4;

vert_lab = mtimes(M_R_total,vert.').';  