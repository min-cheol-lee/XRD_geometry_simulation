clear;
close all;

%%%%%% Created by Min-Cheol Lee (mclee@lanl.gov)%%%%%%
%%%%%%%%%%%%%%%%% input parameters %%%%%%%%%%%%%%%%%%%

% Bragg peak
h = 2; k = 1; l = 1;

% incident angles
alpha_deg = 3; % deg
dev_angle_deg = 10; % deg
%%% please change the sign of dev_angle_dev if you want to place the
%%% optical beam on the opposite side when it's passing through the sample.

% X-ray (10 keV)
lambda = 1.2398; % 1/A

% surface normal
surface = [1 0 0];

%%%%%%%%%%%%%%%%% main code %%%%%%%%%%%%%%%%%%%

crystal_setting;
graphic_setting;

figure_crystal_frame;
rotate_crystal_to_lab;

figure_lab_frame;
figure_sample_views;

rotate_crystal_init_alignment;
%figure_sample_phi;

%%%%%%%%%%%%%%%%% output angles for alignment %%%%%%%%%%%%%%%%%%%

omega_deg = sam_omega*180/pi;
chi_deg = sam_chi*180/pi+90;

sam_phi = atan(sam_b_init(3)/sam_b_init(1));
phi_deg = sam_phi*180/pi;

optical_alpha_deg = 90-acos(dot(optical,surface_lab))*180/pi;
pol_optical_c_axis_deg = pol_optical_c_axis * 180/pi;

th_deg = th*180/pi;
tth_deg = 2*th_deg;

clearvars -except phi_deg chi_deg omega_deg angle_optical_c_axis_deg optical_alpha_deg tth_deg

