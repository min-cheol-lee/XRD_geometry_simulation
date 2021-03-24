
figure(1)
hold on;
box on;
plot3(vec_Ghkl(:,1),vec_Ghkl(:,2),vec_Ghkl(:,3),'-','linewidth',3,'color',[1 0.6 0]);
plot3(vec_surface(:,1),vec_surface(:,2),vec_surface(:,3),'-','linewidth',3,'color',[0 0.6 1]);
plot3(vec_x(:,1),vec_x(:,2),vec_x(:,3),'--','color','k');
plot3(vec_y(:,1),vec_y(:,2),vec_y(:,3),'--','color','k');
plot3(vec_z(:,1),vec_z(:,2),vec_z(:,3),'--','color','k');

patch('Faces',fac,'Vertices',vert,'FaceColor',[0.8 0.8 0.8]);  % patch function
axis([-1 1 -1 1 -1 1]);
grid();
material shiny;
alphamap('rampdown');
view(120,30);


for i=1:N
    Xin_z(i,:) = [cos(2*pi/N*i) sin(2*pi/N*i) tan(th)];
    Xin_z(i,:) = Xin_z(i,:)./norm(Xin_z(i,:));
    Xin_T = transpose(Xin_z(i,:));
    Xin_R = mtimes(M_R_phi,mtimes(M_R_th,Xin_T));
    Xin(i,:) = Xin_R(:); 
    in_ang(i,1) = 90-acos(dot(surface(:),Xin(i,:)))*180/pi;
    in_ang(i,2) = in_ang(i,1)-alpha_deg;
end

[alpha_diff,I] = min(abs(in_ang(:,2)));
alpha_real = alpha_diff + alpha_deg;


for i=1:round(N/100):N
    vec_Xin(1,:) = [0 0 0];
    vec_Xin(2,:) = Xin(i,:);
    plot3(vec_Xin(:,1),vec_Xin(:,2),vec_Xin(:,3),'-','linewidth',1,'color',[0.5 0.5 0.5]);
end

i = I;
vec_Xin(1,:) = [0 0 0];
vec_Xin(2,:) = Xin(i,:);
plot3(vec_Xin(:,1),vec_Xin(:,2),vec_Xin(:,3),'-','linewidth',2,'color','k');


Xin_alpha(:) = Xin(I,:);
Xout_alpha(:) = (Ghkl_n(:)*G - Xin_alpha(:)*2*pi/lambda);
Xout_alpha(:) = Xout_alpha(:)/norm(Xout_alpha(:));

vec_Xout(1,:) = [0 0 0];
vec_Xout(2,:) = Xout_alpha(:);
plot3(vec_Xout(:,1),vec_Xout(:,2),vec_Xout(:,3),'-','linewidth',2,'color','k');
set(figure(1), 'position', [100 150 500 500])
