
figure(4)
hold on;
box on;
plot3(vec_x(:,1),vec_x(:,2),vec_x(:,3),'--','color',[0.5 0.5 0.5]);
plot3(vec_y(:,1),vec_y(:,2),vec_y(:,3),'--','color',[0.5 0.5 0.5]);
plot3(vec_z(:,1),vec_z(:,2),vec_z(:,3),'--','color',[0.5 0.5 0.5]);
plot3(vec_sam_b_init(:,1),vec_sam_b_init(:,2),vec_sam_b_init(:,3),'--','linewidth',1.5,'color','k');
plot3(vec_sam_c_init(:,1),vec_sam_c_init(:,2),vec_sam_c_init(:,3),'--','linewidth',1.5,'color','k');
patch('Faces',fac,'Vertices',vert_init,'FaceColor',[0.8 0.8 0.8]);  % patch function
axis([-1 1 -1 1 -1 1]);
grid();
material shiny;
alphamap('rampdown');
view(120,30);
set(figure(4), 'position', [600 150 600 500])
