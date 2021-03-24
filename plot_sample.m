hold on;
box on;
plot3(vec_Xin_lab(:,1),vec_Xin_lab(:,2),vec_Xin_lab(:,3),'-','linewidth',2,'color','k');

plot3(vec_x(:,1),vec_x(:,2),vec_x(:,3),'--','color',[0.5 0.5 0.5]);
plot3(vec_y(:,1),vec_y(:,2),vec_y(:,3),'--','color',[0.5 0.5 0.5]);
plot3(vec_z(:,1),vec_z(:,2),vec_z(:,3),'--','color',[0.5 0.5 0.5]);
plot3(vec_sam_b_lab(:,1),vec_sam_b_lab(:,2),vec_sam_b_lab(:,3),'--','linewidth',1.5,'color','k');
plot3(vec_sam_c_lab(:,1),vec_sam_c_lab(:,2),vec_sam_c_lab(:,3),'--','linewidth',1.5,'color','k');
plot3(vec_surface_lab(:,1),vec_surface_lab(:,2),vec_surface_lab(:,3),'-','linewidth',3,'color',[0 0.6 1]);

patch('Faces',fac,'Vertices',vert_lab,'FaceColor',[0.8 0.8 0.8]);  % patch function
axis([-1 1 -1 1 -1 1]);
grid();
material shiny;
alphamap('rampdown');
