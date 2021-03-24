figure(2)
hold on;
box on;
plot3(vec_Xin_lab(:,1),vec_Xin_lab(:,2),vec_Xin_lab(:,3),'-','linewidth',2,'color','k');
plot3(vec_Ghkl_lab(:,1),vec_Ghkl_lab(:,2),vec_Ghkl_lab(:,3),'-','linewidth',3,'color',[1 0.6 0]);
plot3(vec_surface_lab(:,1),vec_surface_lab(:,2),vec_surface_lab(:,3),'-','linewidth',3,'color',[0 0.6 1]);
plot3(vec_optical(:,1),vec_optical(:,2),vec_optical(:,3),'-','linewidth',3,'color',[0.8 0 0]);
plot3(vec_sam_b_lab(:,1),vec_sam_b_lab(:,2),vec_sam_b_lab(:,3),'--','linewidth',2,'color',[0 0 1]);
plot3(vec_sam_c_lab(:,1),vec_sam_c_lab(:,2),vec_sam_c_lab(:,3),'--','linewidth',2,'color',[1 0 0]);

plot3(vec_optical_b(:,1),vec_optical_b(:,2),vec_optical_b(:,3),'-','linewidth',4,'color',[0 0 1]);
plot3(vec_optical_c(:,1),vec_optical_c(:,2),vec_optical_c(:,3),'-','linewidth',4,'color',[1 0 0]);

p0 = patch('Faces',fac,'Vertices',vert_lab,'FaceColor',[0.8 0.8 0.8]);  % patch function
axis([-1 1 -1 1 -1 1]);
grid();
material shiny;
alphamap('rampdown');
view(120,30);


p1 = plot3(vec_Xout_lab(:,1),vec_Xout_lab(:,2),vec_Xout_lab(:,3),'-','linewidth',2,'color','k');
p2 = plot3(vec_x(:,1),vec_x(:,2),vec_x(:,3),'--','color',[0.5 0.5 0.5]);
p3 = plot3(vec_y(:,1),vec_y(:,2),vec_y(:,3),'--','color',[0.5 0.5 0.5]);
p4 = plot3(vec_z(:,1),vec_z(:,2),vec_z(:,3),'--','color',[0.5 0.5 0.5]);

%p7 = plot3(vec_optical_vert(:,1),vec_optical_vert(:,2),vec_optical_vert(:,3),'-','linewidth',3,'color',[1 0.6 0]);

p0.Annotation.LegendInformation.IconDisplayStyle = 'off';
p1.Annotation.LegendInformation.IconDisplayStyle = 'off';
p2.Annotation.LegendInformation.IconDisplayStyle = 'off';
p3.Annotation.LegendInformation.IconDisplayStyle = 'off';
p4.Annotation.LegendInformation.IconDisplayStyle = 'off';
p5.Annotation.LegendInformation.IconDisplayStyle = 'off';
p6.Annotation.LegendInformation.IconDisplayStyle = 'off';

if surface == [1 0 0]
    inp1 = 'b';
    inp2 = 'c';
elseif surface == [0 1 0]
    inp1 = 'c';
    inp2 = 'a';
elseif surface == [0 0 1]
    inp1 = 'a';
    inp2 = 'b';
end

legend('X_{ray}','G_{hkl}','surface','optical',strcat('sample in-plane axis 1 (',inp1,')'),...
    strcat('sample in-plane axis 2 (',inp2,')'),strcat('optical polarization ||',inp1),strcat('optical polarization ||',inp2))
set(figure(2), 'position', [100 100 700 500])

