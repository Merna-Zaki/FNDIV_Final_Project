addpath ('/Users/School/Documents/GitHub/FNDIV_Final_project')
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

OUD_Active_pos_h1_FCz= feedback_data{6, 2:end};
OUD_Active_neg_h1_FCz= feedback_data{7, 2:end};
OUD_Active_pos_h2_FCz= feedback_data{8, 2:end};
OUD_Active_neg_h2_FCz= feedback_data{9, 2:end};

OUD_Sham_cue_h1_FCz= cue_data{26, 2:end};
OUD_Sham_cue_h2_FCz= cue_data{27, 2:end};
OUD_Sham_cue_h1_AB_FCz= cue_data{28, 2:end};
OUD_Sham_cue_h2_AB_FCz= cue_data{29, 2:end};
OUD_Sham_cue_h1_CD_FCz= cue_data{30, 2:end};
OUD_Sham_cue_h2_CD_FCz= cue_data{31, 2:end};

OUD_Sham_pos_h1_FCz= feedback_data{18, 2:end};
OUD_Sham_neg_h1_FCz= feedback_data{19, 2:end};
OUD_Sham_pos_h2_FCz= feedback_data{20, 2:end};
OUD_Sham_neg_h2_FCz= feedback_data{21, 2:end};

Ctrl_Active_cue_h1_FCz= cue_data{44, 2:end};
Ctrl_Active_cue_h2_FCz= cue_data{45, 2:end};
Ctrl_Active_cue_h1_AB_FCz= cue_data{46, 2:end};
Ctrl_Active_cue_h2_AB_FCz= cue_data{47, 2:end};
Ctrl_Active_cue_h1_CD_FCz= cue_data{48, 2:end};
Ctrl_Active_cue_h2_CD_FCz= cue_data{49, 2:end};

Ctrl_Active_pos_h1_FCz= feedback_data{30, 2:end};
Ctrl_Active_neg_h1_FCz= feedback_data{31, 2:end};
Ctrl_Active_pos_h2_FCz= feedback_data{32, 2:end};
Ctrl_Active_neg_h2_FCz= feedback_data{33, 2:end};

Ctrl_Sham_cue_h1_FCz= cue_data{62, 2:end};
Ctrl_Sham_cue_h2_FCz= cue_data{63, 2:end};
Ctrl_Sham_cue_h1_AB_FCz= cue_data{64, 2:end};
Ctrl_Sham_cue_h2_AB_FCz= cue_data{65, 2:end};
Ctrl_Sham_cue_h1_CD_FCz= cue_data{66, 2:end};
Ctrl_Sham_cue_h2_CD_FCz= cue_data{67, 2:end};

Ctrl_Sham_pos_h1_FCz= feedback_data{42, 2:end};
Ctrl_Sham_neg_h1_FCz= feedback_data{43, 2:end};
Ctrl_Sham_pos_h2_FCz= feedback_data{44, 2:end};
Ctrl_Sham_neg_h2_FCz= feedback_data{45, 2:end};

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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimit(1) yLimit(1) yLimit(2) yLimit(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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
patch([235 285 285 235], [yLimits(1) yLimits(1) yLimits(2) yLimits(2)],[0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.4) % adds a gray shaded area around n200 time window 
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

OUD_Active_pos_h1_Cz= feedback_data{10, 2:end};
OUD_Active_neg_h1_Cz= feedback_data{11, 2:end};
OUD_Active_pos_h2_Cz= feedback_data{12, 2:end};
OUD_Active_neg_h2_Cz= feedback_data{13, 2:end};

OUD_Sham_cue_h1_Cz= cue_data{32, 2:end};
OUD_Sham_cue_h2_Cz= cue_data{33, 2:end};
OUD_Sham_cue_h1_AB_Cz= cue_data{34, 2:end};
OUD_Sham_cue_h2_AB_Cz= cue_data{35, 2:end};
OUD_Sham_cue_h1_CD_Cz= cue_data{36, 2:end};
OUD_Sham_cue_h2_CD_Cz= cue_data{37, 2:end};

OUD_Sham_pos_h1_Cz= feedback_data{22, 2:end};
OUD_Sham_neg_h1_Cz= feedback_data{23, 2:end};
OUD_Sham_pos_h2_Cz= feedback_data{24, 2:end};
OUD_Sham_neg_h2_Cz= feedback_data{25, 2:end};

Ctrl_Active_cue_h1_Cz= cue_data{50, 2:end};
Ctrl_Active_cue_h2_Cz= cue_data{51, 2:end};
Ctrl_Active_cue_h1_AB_Cz= cue_data{52, 2:end};
Ctrl_Active_cue_h2_AB_Cz= cue_data{53, 2:end};
Ctrl_Active_cue_h1_CD_Cz= cue_data{54, 2:end};
Ctrl_Active_cue_h2_CD_Cz= cue_data{55, 2:end};

Ctrl_Active_pos_h1_Cz= feedback_data{34, 2:end};
Ctrl_Active_neg_h1_Cz= feedback_data{35, 2:end};
Ctrl_Active_pos_h2_Cz= feedback_data{36, 2:end};
Ctrl_Active_neg_h2_Cz= feedback_data{37, 2:end};

Ctrl_Sham_cue_h1_Cz= cue_data{68, 2:end};
Ctrl_Sham_cue_h2_Cz= cue_data{69, 2:end};
Ctrl_Sham_cue_h1_AB_Cz= cue_data{70, 2:end};
Ctrl_Sham_cue_h2_AB_Cz= cue_data{71, 2:end};
Ctrl_Sham_cue_h1_CD_Cz= cue_data{72, 2:end};
Ctrl_Sham_cue_h2_CD_Cz= cue_data{73, 2:end};

Ctrl_Sham_pos_h1_Cz= feedback_data{46, 2:end};
Ctrl_Sham_neg_h1_Cz= feedback_data{47, 2:end};
Ctrl_Sham_pos_h2_Cz= feedback_data{48, 2:end};
Ctrl_Sham_neg_h2_Cz= feedback_data{49, 2:end};

%% Figure 1: Plotting ERP for cue (average of ab & cd) during half 1 and half 2 at channel (Cz)

% ---- Creating Cue Plot ----
figure (1); clf;
sgtitle ('Cue 1st Half vs Cue 2nd Half (Cz)');


% Plotting OUD Active ERP
subplot(2,2,1);
plot(timepoints, OUD_Active_cue_h1_Cz, 'Color', [0.13 0.40 0.33], 'LineStyle', '-', 'LineWidth', 1.5)
hold on;
plot(timepoints, OUD_Active_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)

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
plot(timepoints, OUD_Sham_cue_h1_Cz, 'Color', [0.13 0.40 0.33] , 'LineStyle', '-', 'LineWidth',1.5)
hold on;
plot(timepoints, OUD_Sham_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
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
plot(timepoints, Ctrl_Active_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
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
plot(timepoints, Ctrl_Sham_cue_h2_Cz, 'Color', 'm', 'LineStyle', '-', 'LineWidth',1.5)
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

%% Figure 3: Plotting ERP for Positve & Negative Feedback during half 1 and half 2 at channel (Cz)

% ---- Creating feedback Plot ----
figure (3);
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

%%