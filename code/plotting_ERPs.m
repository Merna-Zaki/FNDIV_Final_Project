addpath ('/Users/School/Documents/GitHub/FNDIV_Final_project/code')
addpath ('/Users/School/Documents/GitHub/FNDIV_Final_project/data')
feedback_data = readtable('feedback_waveforms.csv'); %imports csv file containing exported feeedback waveforms
cue_data = readtable('cue_waveforms.csv'); %imports csv file containing exported cue waveforms

%% ---- Defining variables (FCz)----

timepoints= cue_data{1, 2:end}; % Defines the segmentation used for the grand averages (same for both cue & feedback)

OUD_Active_cue_h1_FCz= cue_data{8, 2:end};
OUD_Active_cue_h2_FCz= cue_data{9, 2:end};
OUD_Active_cue_h1_AB_FCz= cue_data{10, 2:end};
OUD_Active_cue_h2_AB_FCz= cue_data{11, 2:end};
OUD_Active_cue_h1_CD_FCz= cue_data{12, 2:end};
OUD_Active_cue_h2_CD_FCz= cue_data{13, 2:end};

OUD_Active_pos_all_FCz= feedback_data{8, 2:end};
OUD_Active_neg_all_FCz= feedback_data{9, 2:end};
OUD_Active_pos_h1_FCz= feedback_data{10, 2:end};
OUD_Active_neg_h1_FCz= feedback_data{11, 2:end};
OUD_Active_pos_h2_FCz= feedback_data{12, 2:end};
OUD_Active_neg_h2_FCz= feedback_data{13, 2:end};

OUD_Sham_cue_h1_FCz= cue_data{26, 2:end};
OUD_Sham_cue_h2_FCz= cue_data{27, 2:end};
OUD_Sham_cue_h1_AB_FCz= cue_data{28, 2:end};
OUD_Sham_cue_h2_AB_FCz= cue_data{29, 2:end};
OUD_Sham_cue_h1_CD_FCz= cue_data{30, 2:end};
OUD_Sham_cue_h2_CD_FCz= cue_data{31, 2:end};

OUD_Sham_pos_all_FCz= feedback_data{26, 2:end};
OUD_Sham_neg_all_FCz= feedback_data{27, 2:end};
OUD_Sham_pos_h1_FCz= feedback_data{28, 2:end};
OUD_Sham_neg_h1_FCz= feedback_data{29, 2:end};
OUD_Sham_pos_h2_FCz= feedback_data{30, 2:end};
OUD_Sham_neg_h2_FCz= feedback_data{31, 2:end};

Ctrl_Active_cue_h1_FCz= cue_data{44, 2:end};
Ctrl_Active_cue_h2_FCz= cue_data{45, 2:end};
Ctrl_Active_cue_h1_AB_FCz= cue_data{46, 2:end};
Ctrl_Active_cue_h2_AB_FCz= cue_data{47, 2:end};
Ctrl_Active_cue_h1_CD_FCz= cue_data{48, 2:end};
Ctrl_Active_cue_h2_CD_FCz= cue_data{49, 2:end};

Ctrl_Active_pos_all_FCz= feedback_data{44, 2:end};
Ctrl_Active_neg_all_FCz= feedback_data{45, 2:end};
Ctrl_Active_pos_h1_FCz= feedback_data{46, 2:end};
Ctrl_Active_neg_h1_FCz= feedback_data{47, 2:end};
Ctrl_Active_pos_h2_FCz= feedback_data{48, 2:end};
Ctrl_Active_neg_h2_FCz= feedback_data{49, 2:end};

Ctrl_Sham_cue_h1_FCz= cue_data{62, 2:end};
Ctrl_Sham_cue_h2_FCz= cue_data{63, 2:end};
Ctrl_Sham_cue_h1_AB_FCz= cue_data{64, 2:end};
Ctrl_Sham_cue_h2_AB_FCz= cue_data{65, 2:end};
Ctrl_Sham_cue_h1_CD_FCz= cue_data{66, 2:end};
Ctrl_Sham_cue_h2_CD_FCz= cue_data{67, 2:end};

Ctrl_Sham_pos_all_FCz= feedback_data{62, 2:end};
Ctrl_Sham_neg_all_FCz= feedback_data{63, 2:end};
Ctrl_Sham_pos_h1_FCz= feedback_data{64, 2:end};
Ctrl_Sham_neg_h1_FCz= feedback_data{65, 2:end};
Ctrl_Sham_pos_h2_FCz= feedback_data{66, 2:end};
Ctrl_Sham_neg_h2_FCz= feedback_data{67, 2:end};

%% Figure 1: Plotting ERP for cue (average of ab & cd) during half 1 and half 2 at channel (FCz)

% ---- Creating Cue Plot ----
figure (1); clf;
sgtitle ('Cue 1st Half vs Cue 2nd Half (FCz)');


% Plotting OUD Active ERP
subplot(2,2,1);
plot(timepoints, OUD_Active_cue_h1_FCz, 'Color', [0.13 0.40 0.33], 'LineStyle', '-', 'LineWidth', 1.5)
hold on;
plot(timepoints, OUD_Active_cue_h2_FCz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)

yLimit= [-4,8]; %defines y-axis limits that will be used for the gray shaded area
ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
legend({'Cue Half 1', 'Cue Half 2'}, 'Location', 'Best');
title('OUD Active');
grid on;

% Plotting OUD Sham ERP
subplot(2,2,2);
plot(timepoints, OUD_Sham_cue_h1_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Sham_cue_h2_FCz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 200 300], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('OUD Sham');
grid on;

% Plotting Healthy Controls Active ERP
subplot(2,2,3);
plot(timepoints, Ctrl_Active_cue_h1_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Active_cue_h2_FCz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Active');
grid on;

% Plotting Healthy Controls Sham ERP
subplot(2,2,4);
plot(timepoints, Ctrl_Sham_cue_h1_FCz, 'Color', [0.13 0.40 0.33], 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Sham_cue_h2_FCz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Sham');
grid on;

%% Figure 2: Plotting ERP for AB & CD cues during half 1 and half 2 at channel (FCz)

% ---- Creating AB & CD Cue Plot ----
figure (2);
sgtitle ('AB & CD Cues during 1st Half vs 2nd Half (FCz)');


% Plotting OUD Active ERP
subplot(2,2,1);
plot(timepoints, OUD_Active_cue_h1_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Active_cue_h2_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Active_cue_h1_CD_FCz, 'Color', 'm' , 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, OUD_Active_cue_h2_CD_FCz, 'Color', 'm' , 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
legend({'AB Cue Half 1', 'AB Cue Half 2', 'CD Cue Half 1', 'CD Cue Half 2'}, 'Location', 'Best');
title('OUD Active');
grid on;

% Plotting OUD Sham ERP
subplot(2,2,2);
plot(timepoints, OUD_Sham_cue_h1_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Sham_cue_h2_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_cue_h1_CD_FCz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_cue_h2_CD_FCz, 'Color', 'm', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('OUD Sham');
grid on;

% Plotting Healthy Controls Active ERP
subplot(2,2,3);
plot(timepoints, Ctrl_Active_cue_h1_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Active_cue_h2_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_cue_h1_CD_FCz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_cue_h2_CD_FCz, 'Color', 'm', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Active');
grid on;

% Plotting Healthy Controls Sham ERP
subplot(2,2,4);
plot(timepoints, Ctrl_Sham_cue_h1_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Sham_cue_h2_AB_FCz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_cue_h1_CD_FCz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_cue_h2_CD_FCz, 'Color', 'm', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Sham');
grid on;

%% Figure 3: Plotting ERP for Positve & Negative Feedback during half 1 and half 2 at channel (FCz)

% ---- Creating feedback Plot ----
figure (3);
sgtitle ('Positve & Negative Feedback 1st Half vs Half');


% Plotting OUD Active ERP
subplot(2,2,1);
plot(timepoints, OUD_Active_pos_h1_FCz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Active_neg_h1_FCz, 'Color', 'r', 'LineStyle', '-', 'LineWidth', 1.5)
plot(timepoints, OUD_Active_pos_h2_FCz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Active_neg_h2_FCz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

yLimits= [-4,16]; %defines y-axis limits that will be used for the gray shaded area
ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
legend({'Positve fb Half 1', 'Negative fb Half 1', 'Positve fb Half 2', 'Negative fb Half 2'}, 'Location', 'Best');
title('OUD Active');
grid on;

% Plotting OUD Sham ERP
subplot(2,2,2);
plot(timepoints, OUD_Sham_pos_h1_FCz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Sham_neg_h1_FCz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_pos_h2_FCz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_neg_h2_FCz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('OUD Sham');
grid on;

% Plotting Healthy Controls Active ERP
subplot(2,2,3);
plot(timepoints, Ctrl_Active_pos_h1_FCz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Active_neg_h1_FCz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_pos_h2_FCz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_neg_h2_FCz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Active');
grid on;

% Plotting Healthy Controls Sham ERP
subplot(2,2,4);
plot(timepoints, Ctrl_Sham_pos_h1_FCz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Sham_neg_h1_FCz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_pos_h2_FCz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_neg_h2_FCz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Sham');
grid on;

%% ---- Defining Variables (Cz) ----

timepoints= cue_data{1, 2:end}; % Defines the segmentation used for the grand averages (same for both cue & feedback)

OUD_Active_cue_h1_Cz= cue_data{14, 2:end};
OUD_Active_cue_h2_Cz= cue_data{15, 2:end};
OUD_Active_cue_h1_AB_Cz= cue_data{16, 2:end};
OUD_Active_cue_h2_AB_Cz= cue_data{17, 2:end};
OUD_Active_cue_h1_CD_Cz= cue_data{18, 2:end};
OUD_Active_cue_h2_CD_Cz= cue_data{19, 2:end};

OUD_Active_pos_all_Cz= feedback_data{14, 2:end};
OUD_Active_neg_all_Cz= feedback_data{15, 2:end};
OUD_Active_pos_h1_Cz= feedback_data{16, 2:end};
OUD_Active_neg_h1_Cz= feedback_data{17, 2:end};
OUD_Active_pos_h2_Cz= feedback_data{18, 2:end};
OUD_Active_neg_h2_Cz= feedback_data{19, 2:end};

OUD_Sham_cue_h1_Cz= cue_data{32, 2:end};
OUD_Sham_cue_h2_Cz= cue_data{33, 2:end};
OUD_Sham_cue_h1_AB_Cz= cue_data{34, 2:end};
OUD_Sham_cue_h2_AB_Cz= cue_data{35, 2:end};
OUD_Sham_cue_h1_CD_Cz= cue_data{36, 2:end};
OUD_Sham_cue_h2_CD_Cz= cue_data{37, 2:end};

OUD_Sham_pos_all_Cz= feedback_data{32, 2:end};
OUD_Sham_neg_all_Cz= feedback_data{33, 2:end};
OUD_Sham_pos_h1_Cz= feedback_data{34, 2:end};
OUD_Sham_neg_h1_Cz= feedback_data{35, 2:end};
OUD_Sham_pos_h2_Cz= feedback_data{36, 2:end};
OUD_Sham_neg_h2_Cz= feedback_data{37, 2:end};

Ctrl_Active_cue_h1_Cz= cue_data{50, 2:end};
Ctrl_Active_cue_h2_Cz= cue_data{51, 2:end};
Ctrl_Active_cue_h1_AB_Cz= cue_data{52, 2:end};
Ctrl_Active_cue_h2_AB_Cz= cue_data{53, 2:end};
Ctrl_Active_cue_h1_CD_Cz= cue_data{54, 2:end};
Ctrl_Active_cue_h2_CD_Cz= cue_data{55, 2:end};

Ctrl_Active_pos_all_Cz= feedback_data{50, 2:end};
Ctrl_Active_neg_all_Cz= feedback_data{51, 2:end};
Ctrl_Active_pos_h1_Cz= feedback_data{52, 2:end};
Ctrl_Active_neg_h1_Cz= feedback_data{53, 2:end};
Ctrl_Active_pos_h2_Cz= feedback_data{54, 2:end};
Ctrl_Active_neg_h2_Cz= feedback_data{55, 2:end};

Ctrl_Sham_cue_h1_Cz= cue_data{68, 2:end};
Ctrl_Sham_cue_h2_Cz= cue_data{69, 2:end};
Ctrl_Sham_cue_h1_AB_Cz= cue_data{70, 2:end};
Ctrl_Sham_cue_h2_AB_Cz= cue_data{71, 2:end};
Ctrl_Sham_cue_h1_CD_Cz= cue_data{72, 2:end};
Ctrl_Sham_cue_h2_CD_Cz= cue_data{73, 2:end};

Ctrl_Sham_pos_all_Cz= feedback_data{68, 2:end};
Ctrl_Sham_neg_all_Cz= feedback_data{69, 2:end};
Ctrl_Sham_pos_h1_Cz= feedback_data{70, 2:end};
Ctrl_Sham_neg_h1_Cz= feedback_data{71, 2:end};
Ctrl_Sham_pos_h2_Cz= feedback_data{72, 2:end};
Ctrl_Sham_neg_h2_Cz= feedback_data{73, 2:end};

%% Figure 1: Plotting ERP for cue (average of ab & cd) during half 1 and half 2 at channel (Cz)

% --- compute standard error to plot SE band ---
cue_h1_exported= readtable('exported_cue_h1(Cz).csv');
cue_h2_exported= readtable('exported_cue_h2(Cz).csv');

% compute standard deviation
oud_active = (cue_h1_exported.Var3 == 1) & (cue_h1_exported.Var4 == 1);
oud_sham = (cue_h1_exported.Var3 == -1) & (cue_h1_exported.Var4 == 1);
ctrl_active = (cue_h1_exported.Var3 == 1) & (cue_h1_exported.Var4 == -1);
ctrl_sham = (cue_h1_exported.Var3 == -1) & (cue_h1_exported.Var4 == -1);

stdev1 = std(table2array (cue_h1_exported(oud_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev2 = std(table2array (cue_h2_exported(oud_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

stdev3 = std(table2array (cue_h1_exported(oud_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev4 = std(table2array (cue_h2_exported(oud_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

stdev5 = std(table2array (cue_h1_exported(ctrl_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev6 = std(table2array (cue_h2_exported(ctrl_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

stdev7 = std(table2array (cue_h1_exported(ctrl_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev8 = std(table2array (cue_h2_exported(ctrl_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

% Compute standard error, upper & lower bound for H1
SE_oud_active1 = stdev1 / sqrt(sum(oud_active));
upper_SE_oud_active_h1= OUD_Active_cue_h1_Cz + SE_oud_active1;
lower_SE_oud_active_h1= OUD_Active_cue_h1_Cz - SE_oud_active1;

SE_oud_sham1 = stdev3 / sqrt(sum(oud_sham));
upper_SE_oud_sham_h1= OUD_Sham_cue_h1_Cz + SE_oud_sham1;
lower_SE_oud_sham_h1= OUD_Sham_cue_h1_Cz - SE_oud_sham1;

SE_ctrl_active1 = stdev5 / sqrt(sum(ctrl_active));
upper_SE_ctrl_active_h1= Ctrl_Active_cue_h1_Cz + SE_ctrl_active1;
lower_SE_ctrl_active_h1= Ctrl_Active_cue_h1_Cz - SE_ctrl_active1;

SE_ctrl_sham1 = stdev7 / sqrt(sum(ctrl_sham));
upper_SE_ctrl_sham_h1= Ctrl_Sham_cue_h1_Cz + SE_ctrl_sham1;
lower_SE_ctrl_sham_h1= Ctrl_Sham_cue_h1_Cz - SE_ctrl_sham1;


% Compute standard error , upper & lower bound for H2
SE_oud_active2 = stdev2 / sqrt(sum(oud_active));
upper_SE_oud_active_h2= OUD_Active_cue_h2_Cz + SE_oud_active2;
lower_SE_oud_active_h2= OUD_Active_cue_h2_Cz - SE_oud_active2;

SE_oud_sham2 = stdev4 / sqrt(sum(oud_sham));
upper_SE_oud_sham_h2= OUD_Sham_cue_h2_Cz + SE_oud_sham2;
lower_SE_oud_sham_h2= OUD_Sham_cue_h2_Cz - SE_oud_sham2;

SE_ctrl_active2 = stdev6 / sqrt(sum(ctrl_active));
upper_SE_ctrl_active_h2= Ctrl_Active_cue_h2_Cz + SE_ctrl_active2;
lower_SE_ctrl_active_h2= Ctrl_Active_cue_h2_Cz - SE_ctrl_active2;

SE_ctrl_sham2 = stdev8 / sqrt(sum(ctrl_sham));
upper_SE_ctrl_sham_h2= Ctrl_Sham_cue_h2_Cz + SE_ctrl_sham2;
lower_SE_ctrl_sham_h2= Ctrl_Sham_cue_h2_Cz - SE_ctrl_sham2;

% ---- Creating Cue Plot ----
figure (1); clf;
sgtitle ('Cue 1st Half vs Cue 2nd Half (Cz)');

% Plotting OUD Active ERP
subplot(2,2,1);
c1= plot(timepoints, OUD_Active_cue_h1_Cz, 'Color', [0.13 0.40 0.33], 'LineStyle', '-', 'LineWidth', 1.5);
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_active_h1, fliplr(lower_SE_oud_active_h1)], [0.13 0.40 0.33], ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
c2= plot(timepoints, OUD_Active_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5);
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_active_h2, fliplr(lower_SE_oud_active_h2)], 'm', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');


yLimit= [-4,8]; %defines y-axis limits that will be used for the gray shaded area
ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
legend([c1,c2],{'Cue Half 1', 'Cue Half 2'}, 'Location', 'Best');
title('OUD Active');
grid on;

% Plotting OUD Sham ERP
subplot(2,2,2);
plot(timepoints, OUD_Sham_cue_h1_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_sham_h1, fliplr(lower_SE_oud_sham_h1)], [0.13 0.40 0.33], ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(timepoints, OUD_Sham_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_sham_h2, fliplr(lower_SE_oud_sham_h2)], 'm', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('OUD Sham');
grid on;

% Plotting Healthy Controls Active ERP
subplot(2,2,3);
plot(timepoints, Ctrl_Active_cue_h1_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_active_h1, fliplr(lower_SE_ctrl_active_h1)], [0.13 0.40 0.33], ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(timepoints, Ctrl_Active_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_active_h2, fliplr(lower_SE_ctrl_active_h2)], 'm' , ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Active');
grid on;

% Plotting Healthy Controls Sham ERP
subplot(2,2,4);
plot(timepoints, Ctrl_Sham_cue_h1_Cz, 'Color', [0.13 0.40 0.33], 'LineStyle', '-', 'LineWidth',1.5)
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_sham_h1, fliplr(lower_SE_ctrl_sham_h1)], [0.13 0.40 0.33], ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(timepoints, Ctrl_Sham_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_sham_h2, fliplr(lower_SE_ctrl_sham_h2)], 'm' , ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Sham');
grid on;

%% Figure 2: Plotting ERP for AB & CD cues during half 1 and half 2 at channel (Cz)

% ---- Creating AB & CD Cue Plot ----
figure (2);
sgtitle ('AB & CD Cues during 1st Half vs 2nd Half (Cz)');

% Plotting OUD Active ERP
subplot(2,2,1);
plot(timepoints, OUD_Active_cue_h1_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Active_cue_h2_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Active_cue_h1_CD_Cz, 'Color', 'm' , 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, OUD_Active_cue_h2_CD_Cz, 'Color', 'm' , 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
legend({'AB Cue Half 1', 'AB Cue Half 2', 'CD Cue Half 1', 'CD Cue Half 2'}, 'Location', 'Best');
title('OUD Active');
grid on;

% Plotting OUD Sham ERP
subplot(2,2,2);
plot(timepoints, OUD_Sham_cue_h1_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Sham_cue_h2_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_cue_h1_CD_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_cue_h2_CD_Cz, 'Color', 'm', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('OUD Sham');
grid on;

% Plotting Healthy Controls Active ERP
subplot(2,2,3);
plot(timepoints, Ctrl_Active_cue_h1_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Active_cue_h2_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_cue_h1_CD_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_cue_h2_CD_Cz, 'Color', 'm', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Active');
grid on;

% Plotting Healthy Controls Sham ERP
subplot(2,2,4);
plot(timepoints, Ctrl_Sham_cue_h1_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Sham_cue_h2_AB_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_cue_h1_CD_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_cue_h2_CD_Cz, 'Color', 'm', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 8]); % sets the y-axis range
yticks(-4:2:8); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Sham');
grid on;

%% Figure 3: Plotting ERP for Positve & Negative Feedback at channel (Cz)

% --- compute standard error to plot SE band ---
pos_exported= readtable('exported_pos(Cz).csv');
neg_exported= readtable('exported_neg(Cz).csv');

% compute standard deviation
oud_active = (pos_exported.Var3 == 1) & (pos_exported.Var4 == 1); %groups have the same labels in both pos and neg feedback will not change
oud_sham = (pos_exported.Var3 == -1) & (pos_exported.Var4 == 1);
ctrl_active = (pos_exported.Var3 == 1) & (pos_exported.Var4 == -1);
ctrl_sham = (pos_exported.Var3 == -1) & (pos_exported.Var4 == -1);

stdev9 = std(table2array (pos_exported(oud_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev10 = std(table2array (neg_exported(oud_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

stdev11 = std(table2array (pos_exported(oud_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev12 = std(table2array (neg_exported(oud_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

stdev13 = std(table2array (pos_exported(ctrl_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev14 = std(table2array (neg_exported(ctrl_active, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

stdev15 = std(table2array (pos_exported(ctrl_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)
stdev16 = std(table2array (neg_exported(ctrl_sham, 5:end), 0, 1)); % 0 = normalize by N-1, dim=1 (column-wise)

% Compute standard error, upper & lower bound for positive feedback
SE_oud_active_p = stdev9 / sqrt(sum(oud_active));
upper_SE_oud_active_p= OUD_Active_pos_all_Cz + SE_oud_active_p;
lower_SE_oud_active_p= OUD_Active_pos_all_Cz - SE_oud_active_p;

SE_oud_sham_p = stdev11 / sqrt(sum(oud_sham));
upper_SE_oud_sham_p= OUD_Sham_pos_all_Cz + SE_oud_sham_p;
lower_SE_oud_sham_p= OUD_Sham_pos_all_Cz - SE_oud_sham_p;

SE_ctrl_active_p = stdev13 / sqrt(sum(ctrl_active));
upper_SE_ctrl_active_p= Ctrl_Active_pos_all_Cz + SE_ctrl_active_p;
lower_SE_ctrl_active_p= Ctrl_Active_pos_all_Cz - SE_ctrl_active_p;

SE_ctrl_sham_p = stdev15 / sqrt(sum(ctrl_sham));
upper_SE_ctrl_sham_p= Ctrl_Sham_pos_all_Cz + SE_ctrl_sham_p;
lower_SE_ctrl_sham_p= Ctrl_Sham_pos_all_Cz - SE_ctrl_sham_p;

% Compute standard error , upper & lower bound for negative feedback
SE_oud_active_n = stdev10 / sqrt(sum(oud_active));
upper_SE_oud_active_n= OUD_Active_neg_all_Cz + SE_oud_active_n;
lower_SE_oud_active_n= OUD_Active_neg_all_Cz - SE_oud_active_n;

SE_oud_sham_n = stdev12 / sqrt(sum(oud_sham));
upper_SE_oud_sham_n= OUD_Sham_neg_all_Cz + SE_oud_sham_n;
lower_SE_oud_sham_n= OUD_Sham_neg_all_Cz - SE_oud_sham_n;

SE_ctrl_active_n = stdev14 / sqrt(sum(ctrl_active));
upper_SE_ctrl_active_n= Ctrl_Active_neg_all_Cz + SE_ctrl_active_n;
lower_SE_ctrl_active_n= Ctrl_Active_neg_all_Cz - SE_ctrl_active_n;

SE_ctrl_sham_n = stdev16 / sqrt(sum(ctrl_sham));
upper_SE_ctrl_sham_n= Ctrl_Sham_neg_all_Cz + SE_ctrl_sham_n;
lower_SE_ctrl_sham_n= Ctrl_Sham_neg_all_Cz - SE_ctrl_sham_n;

% ---- Creating feedback Plot ----
figure (3);
sgtitle ('Positive & Negative Feedback (Cz)');

% Plotting OUD Active ERP
subplot(2,2,1);
p = plot(timepoints, OUD_Active_pos_all_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5);
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_active_p, fliplr(lower_SE_oud_active_p)],'b', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
n = plot(timepoints, OUD_Active_neg_all_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth', 1.5);
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_active_n, fliplr(lower_SE_oud_active_n)],'r', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');

yLimits= [-4,16]; %defines y-axis limits that will be used for the gray shaded area
ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
legend([p,n],{'Positve fb', 'Negative fb'}, 'Location', 'Best');
title('OUD Active');
grid on;

% Plotting OUD Sham ERP
subplot(2,2,2);
plot(timepoints, OUD_Sham_pos_all_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_sham_p, fliplr(lower_SE_oud_sham_p)],'b', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(timepoints, OUD_Sham_neg_all_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
fill([timepoints, fliplr(timepoints)], [upper_SE_oud_sham_n, fliplr(lower_SE_oud_sham_n)],'r', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('OUD Sham');
grid on;

% Plotting Healthy Controls Active ERP
subplot(2,2,3);
plot(timepoints, Ctrl_Active_pos_all_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_active_p, fliplr(lower_SE_ctrl_active_p)],'b', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(timepoints, Ctrl_Active_neg_all_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_active_n, fliplr(lower_SE_ctrl_active_n)],'r', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Active');
grid on;

% Plotting Healthy Controls Sham ERP
subplot(2,2,4);
plot(timepoints, Ctrl_Sham_pos_all_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_sham_p, fliplr(lower_SE_ctrl_sham_p)],'b', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(timepoints, Ctrl_Sham_neg_all_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
fill([timepoints, fliplr(timepoints)], [upper_SE_ctrl_sham_n, fliplr(lower_SE_ctrl_sham_n)],'r', ...
    'FaceAlpha', 0.2, 'EdgeColor', 'none');

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Sham');
grid on;

%% Figure 4: Plotting ERP for Positve & Negative Feedback during half 1 and half 2 at channel (Cz)

% ---- Creating feedback Plot ----
figure (4);
sgtitle ('Positve & Negative Feedback 1st Half vs Half (Cz)');


% Plotting OUD Active ERP
subplot(2,2,1);
plot(timepoints, OUD_Active_pos_h1_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Active_neg_h1_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth', 1.5)
plot(timepoints, OUD_Active_pos_h2_Cz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Active_neg_h2_Cz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

yLimits= [-4,16]; %defines y-axis limits that will be used for the gray shaded area
ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
legend({'Positve fb Half 1', 'Negative fb Half 1', 'Positve fb Half 2', 'Negative fb Half 2'}, 'Location', 'Best');
title('OUD Active');
grid on;

% Plotting OUD Sham ERP
subplot(2,2,2);
plot(timepoints, OUD_Sham_pos_h1_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Sham_neg_h1_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_pos_h2_Cz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, OUD_Sham_neg_h2_Cz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('OUD Sham');
grid on;

% Plotting Healthy Controls Active ERP
subplot(2,2,3);
plot(timepoints, Ctrl_Active_pos_h1_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Active_neg_h1_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_pos_h2_Cz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Active_neg_h2_Cz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Active');
grid on;

% Plotting Healthy Controls Sham ERP
subplot(2,2,4);
plot(timepoints, Ctrl_Sham_pos_h1_Cz, 'Color', 'b', 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, Ctrl_Sham_neg_h1_Cz, 'Color', 'r', 'LineStyle', '-', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_pos_h2_Cz, 'Color', 'b', 'LineStyle', '--', 'LineWidth',1.5)
plot(timepoints, Ctrl_Sham_neg_h2_Cz, 'Color', 'r', 'LineStyle', '--', 'LineWidth',1.5)

ylim([-4, 16]); % sets the y-axis range
yticks(-4:2:16); % adds a line in increaments of 2
ylabel ('Amplitude (µV)')
yline(0, 'k', 'LineWidth', 1) % adds a black line at amplitude 0 (y=0)
xline(0, 'k', 'LineWidth', 1) % adds a black line at stimlus onset (x=0)
xlabel('Time (ms)')
patch([200 300 300 200], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
title('Control Sham');
grid on;

