addpath ('/Users/School/Documents/GitHub/FNDIV_Final_project/data')
data = readtable('data_file_V2.csv'); %imports data csv file

%% Figure 1: boxplot to showcase each subject's N200 mean amp during cue h1 vs cue h2

% Extract variables
cue_values = data.Cz_Cue;
Cue_half = data.Cue_half;
cue_AB_values = data.Cz_Cue_AB;
cue_CD_values = data.Cz_Cue_CD;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
group_colors = lines(4);  % MATLAB’s color map with 4 distinct colors
box_positions = [1, 2, 4, 5, 7, 8, 10, 11];  % H1/H2 pairs for each group
x_positions= [1.5, 4.5, 7.5, 10.5]; % setting the position for the x-labels

figure(1);
sgtitle('Scatter Plots of Cz Cue Amplitudes by Group & task Half');

% ---------- Cue subplot ----------
subplot(3,1,1);
hold on;
title('Cz Cue');
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    % Cue H1 and H2 indices
    idx_H1 = group_idx & (Cue_half == 1);
    idx_H2 = group_idx & (Cue_half == 2);

    % Boxplot H1
    boxplot(cue_values(idx_H1), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s1= scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), cue_values(idx_H1), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(cue_values(idx_H2), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s2= scatter(repmat(box_positions(2*i), sum(idx_H2), 1), cue_values(idx_H2), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);
end
ylim([-12, 9]);
yticks(-12:3:9);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Cue (µV)');
legend([s1, s2], {'Half 1', 'Half 2'}, 'Location', 'best');
grid on;

% ---------- Cue AB subplot ----------
subplot(3,1,2);
hold on;
title('Cz Cue AB');
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    %Cue H1 and H2 indices
    idx_H1 = group_idx & (Cue_half == 1);
    idx_H2 = group_idx & (Cue_half == 2);

    % Boxplot H1
    boxplot(cue_AB_values(idx_H1), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), cue_AB_values(idx_H1), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(cue_AB_values(idx_H2), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i), sum(idx_H2), 1), cue_AB_values(idx_H2), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

end
ylim([-12, 9]);
yticks(-12:3:9);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Cue (µV)');
grid on;

% ---------- Cue CD subplot ----------
subplot(3,1,3);
hold on;
title('Cz Cue CD');
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    %Cue H1 and H2 indices
    idx_H1 = group_idx & (Cue_half == 1);
    idx_H2 = group_idx & (Cue_half == 2);

    % Boxplot H1
    boxplot(cue_CD_values(idx_H1), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), cue_CD_values(idx_H1), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(cue_CD_values(idx_H2), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i), sum(idx_H2), 1), cue_CD_values(idx_H2), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

end
ylim([-12, 9]);
yticks(-12:3:9);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Cue (µV)');
grid on;

%% Figure 2: scatterplot to showcase each subject's N200 mean amp during positive & negative feedback

neg_all= data.Cz_neg_all;
pos_all=data.Cz_pos_all;

figure(2);
sgtitle('Scatter Plots of Cz feedback Amplitudes by Group ')

% ---------- all feedback subplot ----------
hold on;
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    % Boxplot positive feedback
    boxplot(pos_all(group_idx), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s1= scatter(repmat(box_positions(2*i-1), sum(group_idx), 1), pos_all(group_idx), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot negative feedback
    boxplot(neg_all(group_idx), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s2= scatter(repmat(box_positions(2*i), sum(group_idx), 1), neg_all(group_idx), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

end

ylim([-8,36]);
yticks(-8:4:36);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Feedback (µV)');
legend([s1, s2], {'positive fb', 'negative fb'}, 'Location', 'best');
grid on;

%% Figure 3: scatterplot to showcase each subject's N200 mean amp during positive & negative feedback (split by half)

neg_values= data.Cz_Neg;
neg_half= data.Neg_half;

pos_values= data.Cz_Pos;
pos_half= data.Pos_half;

figure(3);
sgtitle('Scatter Plots of Cz feedback Amplitudes by Group & task Half')

% ---------- Half 1 - all feedback subplot ----------
subplot(2,1,1);
hold on;
title('Cz feeedback during H1');
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    % pos index for half 1 and half 2 
    idx_p1 = group_idx & (pos_half == 1);
    idx_n1 = group_idx & (neg_half == 1);

    % Boxplot H1
    boxplot(pos_values(idx_p1), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s1= scatter(repmat(box_positions(2*i-1), sum(idx_p1), 1), pos_values(idx_p1), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(neg_values(idx_n1), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s2= scatter(repmat(box_positions(2*i), sum(idx_n1), 1), neg_values(idx_n1), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

end

ylim([-8,36]);
yticks(-8:4:36);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Feedback (µV)');
legend([s1, s2], {'positive fb', 'negative fb'}, 'Location', 'best');
grid on;

% ---------- Negative feedback subplot ----------
subplot(2,1,2);
hold on;
title('Cz feeedback during H2');
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    idx_p2 = group_idx & (pos_half == 2);
    idx_n2 = group_idx & (neg_half == 2);

    % Boxplot H1
    boxplot(pos_values(idx_p2), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i-1), sum(idx_p2), 1), pos_values(idx_p2), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(neg_values(idx_n2), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i), sum(idx_n2), 1), neg_values(idx_n2), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

end
ylim([-8,36]);
yticks(-8:4:36);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Feedback (µV)');
grid on;

%% Figure 4: scatterplot to showcase each subject's N200 mean amp during positive & negative feedback by half

neg_values= data.Cz_Neg;
neg_half= data.Neg_half;
pos_values= data.Cz_Pos;
pos_half= data.Pos_half;

figure(4);
sgtitle('Scatter Plots of Cz feedback Amplitudes by Group & task Half')

% ---------- Positive feedback subplot ----------
subplot(2,1,1);
hold on;
title('Cz positive feeedback');
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    % pos index for half 1 and half 2 
    idx_H1 = group_idx & (pos_half == 1);
    idx_H2 = group_idx & (pos_half == 2);

    % Boxplot H1
    boxplot(pos_values(idx_H1), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s1= scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), pos_values(idx_H1), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(pos_values(idx_H2), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    s2= scatter(repmat(box_positions(2*i), sum(idx_H2), 1), pos_values(idx_H2), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

end

ylim([-8,36]);
yticks(-8:4:36);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Positive Feedback (µV)');
legend([s1, s2], {'Half 1', 'Half 2'}, 'Location', 'best');
grid on;

% ---------- Negative feedback subplot ----------
subplot(2,1,2);
hold on;
title('Cz negative feeedback');
for i = 1:4
    switch i
        case 1
            group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2
            group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3
            group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4
            group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    idx_H1 = group_idx & (neg_half == 1);
    idx_H2 = group_idx & (neg_half == 2);

    % Boxplot H1
    boxplot(neg_values(idx_H1), 'positions', box_positions(2*i-1), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), neg_values(idx_H1), 60, 'o', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(neg_values(idx_H2), 'positions', box_positions(2*i), 'Widths', 0.7, 'Colors', 'k' , 'Symbol', '');
    hold on;
    scatter(repmat(box_positions(2*i), sum(idx_H2), 1), neg_values(idx_H2), 60, '^', 'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

end
ylim([-8,36]);
yticks(-8:4:36);
xticks(x_positions);
xticklabels(group_labels);
ylabel('Negative Feedback (µV)');
grid on;

%% Linear mixed-effects model

lme_Cue = fitlme(data,'Cz_Cue ~ TMS_group * OUD_group * Cue_half + (1|Subject)');
lme_Cue_AB = fitlme(data,'Cz_Cue_AB ~ TMS_group * OUD_group * Cue_AB_half + (1|Subject)');
lme_Cue_CD = fitlme(data,'Cz_Cue_CD ~ TMS_group * OUD_group * Cue_CD_half + (1|Subject)');
lme_Fb_P = fitlme(data,'Cz_Pos ~ TMS_group * OUD_group * Pos_half + (1|Subject)');
lme_Fb_N = fitlme(data,'Cz_Neg ~ TMS_group * OUD_group * Neg_half + (1|Subject)');

%% Linear mixed-effects model- accounting for age & gender & GCR

lme_Cue_covariates = fitlme(data, 'Cz_Cue ~ TMS_group * OUD_group * Cue_half + gender + age + (1|Subject)');
lme_Cue_AB_covariates = fitlme(data,'Cz_Cue_AB ~ TMS_group * OUD_group * Cue_AB_half + gender + age + (1|Subject)');
lme_Cue_CD_covariates = fitlme(data,'Cz_Cue_CD ~ TMS_group * OUD_group * Cue_CD_half + gender + age + (1|Subject)');
lme_Fb_P_covariates = fitlme(data,'Cz_Pos ~ TMS_group * OUD_group * Pos_half + gender + age +(1|Subject)');
lme_Fb_N_covariates = fitlme(data,'Cz_Neg ~ TMS_group * OUD_group * Neg_half + gender + age +(1|Subject)');

%% printing fixed effect of TMS variable on Cue on cue, positive, and negative feedback

effectName1 = 'TMS_group';

% Find effect on Cue
row = find(strcmp(effectName1,lme_Cue.CoefficientNames));
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f] \n', ...
    effectName1,lme_Cue.Coefficients.Estimate(row),lme_Cue.Coefficients.Lower(row),lme_Cue.Coefficients.Upper(row))

% Running ANOVA (cue)
alpha =0.05;
if lme_Cue.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName1,not,lme_Cue.anova.DF1(row),lme_Cue.anova.DF2(row),lme_Cue.anova.FStat(row),lme_Cue.anova.pValue(row))

% Find effect on positive feedback
row = find(strcmp(effectName1,lme_Fb_P.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName1,lme_Fb_P.Coefficients.Estimate(row),lme_Fb_P.Coefficients.Lower(row),lme_Fb_P.Coefficients.Upper(row))

% Running ANOVA (positive feedback)
alpha =0.05;
if lme_Fb_P_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName1,not,lme_Fb_P.anova.DF1(row),lme_Fb_P.anova.DF2(row),lme_Fb_P.anova.FStat(row),lme_Fb_P.anova.pValue(row))

% Find effect on negative feedback
row = find(strcmp(effectName1,lme_Fb_N.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName1,lme_Fb_N.Coefficients.Estimate(row),lme_Fb_N.Coefficients.Lower(row),lme_Fb_N.Coefficients.Upper(row))

% Running ANOVA (negative feedback)
alpha =0.05;
if lme_Fb_N.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName1,not,lme_Fb_N.anova.DF1(row),lme_Fb_N.anova.DF2(row),lme_Fb_N.anova.FStat(row),lme_Fb_N.anova.pValue(row))

%% printing fixed effect of OUD on cue, positive, and negative feedback

effectName2 = 'OUD_group';

% Find effect on Cue
row = find(strcmp(effectName2,lme_Cue.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName2,lme_Cue.Coefficients.Estimate(row),lme_Cue.Coefficients.Lower(row),lme_Cue.Coefficients.Upper(row))

% Running ANOVA (cue)
alpha =0.05;
if lme_Cue.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName2,not,lme_Cue.anova.DF1(row),lme_Cue.anova.DF2(row),lme_Cue.anova.FStat(row),lme_Cue.anova.pValue(row))

% Find effect on positive feedback
row = find(strcmp(effectName2,lme_Fb_P.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName2,lme_Fb_P.Coefficients.Estimate(row),lme_Fb_P.Coefficients.Lower(row),lme_Fb_P.Coefficients.Upper(row))

% Running ANOVA (positive feedback)
alpha =0.05;
if lme_Fb_P.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName2,not,lme_Fb_P.anova.DF1(row),lme_Fb_P.anova.DF2(row),lme_Fb_P.anova.FStat(row),lme_Fb_P.anova.pValue(row))

% Find effect on negative feedback
row = find(strcmp(effectName2,lme_Fb_N.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName2,lme_Fb_N.Coefficients.Estimate(row),lme_Fb_N.Coefficients.Lower(row),lme_Fb_N.Coefficients.Upper(row))

% Running ANOVA (negative feedback)
alpha =0.05;
if lme_Fb_N_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName2,not,lme_Fb_N.anova.DF1(row),lme_Fb_N.anova.DF2(row),lme_Fb_N.anova.FStat(row),lme_Fb_N.anova.pValue(row))


%% prediciting cue and fb values using the linear mixed models

% Predict from cue model w & w/o covariates
predicted_cue = predict(lme_Cue, data);
predicted_cue_covar = predict(lme_Cue_covariates, data);

% Predict from cue AB model w & w/o covariates
predicted_cue_ab = predict(lme_Cue_AB, data);
predicted_cue_ab_covar = predict(lme_Cue_AB_covariates, data);

% Predict from cue CD model w & w/o covariates
predicted_cue_cd = predict(lme_Cue_CD, data);
predicted_cue_cd_covar = predict(lme_Cue_CD_covariates, data);

% Predict from negative feedback model w & w/o covariates
predicted_fb_neg = predict(lme_Fb_N, data);
predicted_fb_neg_covar = predict(lme_Fb_N_covariates, data);

% Predict from positive feedback model w & w/o covariates
predicted_fb_pos = predict(lme_Fb_P, data);
predicted_fb_pos_covar = predict(lme_Fb_P_covariates, data);

%% Figure 5: plots predicted models on the corresponding CUE scatterplots

% --- LMM ---
lme_cue = fitlme(data, 'Cz_cue_all ~ TMS_group * OUD_group + (1 | Subject)');
lme_positive= fitlme(data, 'Cz_pos_all ~ TMS_group * OUD_group + (1 | Subject)');
lme_negative= fitlme(data, 'Cz_neg_all ~ TMS_group * OUD_group + (1 | Subject)'); 

% --- prediciting n200 mean amp values based on LMM models ---
predicted_CUE= predict(lme_cue, data);
predicted_POS= predict(lme_positive, data);
predicted_NEG= predict(lme_negative, data);

% --- define variable used for plotting ---
cue_all= data.Cz_cue_all;
cue_ab_all= data.Cz_cue_AB_all;
cue_cd_all= data.Cz_cue_CD_all;


figure(5); clf;
sgtitle('Actual vs Predicted N200 mean amplitude during cue')

condition_names = {'Cue','Cue AB', 'Cue CD'};
y_limits = [-12, 9];
x_limits = [-12, 9];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1); %oud sham
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1); %oud active 
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1); %control sham
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1); %control active
    end

    for cond_j = 1:3
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        ylim(y_limits);
        yticks(y_limits(1):3:y_limits(2));
        xlim(x_limits);
        xticks(x_limits(1):3:x_limits(2));
        grid on;

        if cond_j == 1
        % --------- CUE ---------
        % All Cue (ab & cd averaged together)
      
        % Actual values on the x-axis and predicted on the y-axis (x = y)
          scatter(cue_all(group_idx), predicted_CUE(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); 
          hold on; 
        %plots a unity line
         plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

         % --------- CUE AB ---------
        elseif cond_j == 2

          % Cue AB
           scatter(cue_ab_all(group_idx), predicted_CUE(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
           hold on;
         % Plot unity line
           plot(xlim, ylim, 'k--', 'LineWidth', 1.5);
         % --------- CUE CD ---------
        else 
            % Cue CD
            scatter(cue_cd_all(group_idx), predicted_CUE(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
            % Plot unity line
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);
        
        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Amplitude (µV)');
        end
    end
end

%% Figure 6: plots predicted models on the corresponding FEEDBACK scatterplots

figure(6); clf;
sgtitle('Actual vs Predicted N200 mean amplitude during feedback')

condition_names = {'Negative Feedback','Positive Feedback'};
y_limits = [-8, 36];
x_limits = [-8, 36];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1); %oud sham
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1); %oud active 
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1); %control sham
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1); %control active
    end

    for cond_j = 1:2
        subplot_idx = (group_i - 1) * 2 + cond_j;
        subplot(4,2, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        ylim(y_limits);
        yticks(y_limits(1):4:y_limits(2));
        xlim(x_limits);
        xticks(x_limits(1):4:x_limits(2));
        grid on;

        
            % --------- Negative Feedback ---------
        if cond_j == 1

            % scatterplot for negative feedback
            scatter(neg_all(group_idx), predicted_NEG(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
         % Plot unity line to see how well the model fits negative fb data
           plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

         % --------- Positive Feeback ---------
        else  
            % scatterplot for positive feedback
            scatter(pos_all(group_idx), predicted_POS(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on; 
          % Plot unity line to see how well the model fits positive fb data
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Amplitude (µV)');
        end
    end
end

%% Figure 7: plots predicted models on the corresponding CUE scatterplots (split by half)

figure(7); clf;
sgtitle('Actual vs Predicted N200 mean amplitude during cue')

condition_names = {'Cue','Cue AB', 'Cue CD'};
y_limits = [-12, 9];
x_limits = [-12, 9];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1); %oud sham
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1); %oud active 
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1); %control sham
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1); %control active
    end

    for cond_j = 1:3
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        ylim(y_limits);
        yticks(y_limits(1):3:y_limits(2));
        xlim(x_limits);
        xticks(x_limits(1):3:x_limits(2));
        grid on;

        if cond_j == 1
            % --------- CUE ---------
          idx_cue_1 = group_idx & (Cue_half == 1);
          idx_cue_2 = group_idx & (Cue_half == 2);

            % Cue first half
            c_h1 = scatter(cue_values(idx_cue_1), predicted_cue(idx_cue_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on; 

            % Cue second half
            c_h2 = scatter(cue_values(idx_cue_2), predicted_cue(idx_cue_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
            % plot a line of unity to see how the model fits the data
            plot( xlim, ylim,'k--', 'LineWidth', 1.5);

            if subplot_idx == 1
               legend([c_h1 c_h2], {'Half 1', 'Half 2'},'Location', 'best');
            end

         % --------- CUE AB ---------
        elseif cond_j == 2 

           % AB Cues first half
            scatter(cue_AB_values(idx_cue_1), predicted_cue_ab(idx_cue_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
          % AB Cues second half
            scatter(cue_AB_values(idx_cue_2), predicted_cue_ab(idx_cue_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
          % Plot unity line
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

             % --------- CUE CD ---------
        else 

           % CD Cues first half 
            scatter(cue_CD_values(idx_cue_1), predicted_cue_cd(idx_cue_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
          % CD Cues second half
            scatter(cue_CD_values(idx_cue_2), predicted_cue_cd(idx_cue_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
          % Plot unity line
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);
            
        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Amplitude (µV)');
        end
    end
end

%% Figure 8: plots predicted models on the corresponding FEEDBACK scatterplots (split by half)

figure(8); clf;
sgtitle('Actual vs Predicted N200 mean amplitude during feedback')

condition_names = {'Negative Feedback','Positive Feedback'};
y_limits = [-8, 36];
x_limits = [-8, 36];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1); %oud sham
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1); %oud active 
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1); %control sham
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1); %control active
    end

    for cond_j = 1:2
        subplot_idx = (group_i - 1) * 2 + cond_j;
        subplot(4, 2, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        ylim(y_limits);
        yticks(y_limits(1):4:y_limits(2));
        xlim(x_limits);
        xticks(x_limits(1):4:x_limits(2));
        grid on;

        if cond_j == 1
            % --------- Negative Feedback ---------
            idx_neg_1 = group_idx & (neg_half == 1);
            idx_neg_2 = group_idx & (neg_half == 2);

            % Negative first half
            n_h1 = scatter(neg_values(idx_neg_1), predicted_fb_neg(idx_neg_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
            % Negative second half
            n_h2 = scatter(neg_values(idx_neg_2), predicted_fb_neg(idx_neg_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
            % Plot unity line
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

            if subplot_idx == 1
               legend([n_h1 n_h2],{'Half 1','Half 2'},'Location', 'best');
            end

         % --------- Positive Feeback ---------
        else  
            idx_pos_1 = group_idx & (pos_half == 1);
            idx_pos_2 = group_idx & (pos_half == 2);

             % Positive Half 1
            scatter(pos_values(idx_pos_1), predicted_fb_pos(idx_pos_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on; 
            % Positive Half 2
            scatter(pos_values(idx_pos_2),predicted_fb_pos(idx_pos_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Amplitude (µV)');
        end
    end
end

%% Figure 9: plots predicted models (w/covar) on the corresponding CUE scatterplots (split by half)

figure(9); clf;
sgtitle('Actual vs Predicted N200 mean amplitude during cue (w/covar)')

condition_names = {'Cue','Cue AB', 'Cue CD'};
y_limits = [-12, 9];
x_limits = [-12, 9];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1); %oud sham
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1); %oud active 
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1); %control sham
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1); %control active
    end

    for cond_j = 1:3
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        ylim(y_limits);
        yticks(y_limits(1):3:y_limits(2));
        xlim(x_limits);
        xticks(x_limits(1):3:x_limits(2));
        grid on;

        if cond_j == 1
            % --------- CUE ---------
          idx_cue_1 = group_idx & (Cue_half == 1);
          idx_cue_2 = group_idx & (Cue_half == 2);

            % Cue first half
            c_h1 = scatter(cue_values(idx_cue_1), predicted_cue_covar(idx_cue_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on; 

            % Cue second half
            c_h2 = scatter(cue_values(idx_cue_2), predicted_cue_covar(idx_cue_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
            % plot a line of unity to see how the model fits the data
            plot( xlim, ylim,'k--', 'LineWidth', 1.5);

            if subplot_idx == 1
               legend([c_h1 c_h2], {'Half 1', 'Half 2'},'Location', 'best');
            end

         % --------- CUE AB ---------
        elseif cond_j == 2 

           % AB Cues first half
            scatter(cue_AB_values(idx_cue_1), predicted_cue_ab_covar(idx_cue_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
          % AB Cues second half
            scatter(cue_AB_values(idx_cue_2), predicted_cue_ab_covar(idx_cue_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
          % Plot unity line
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

             % --------- CUE CD ---------
        else 

           % CD Cues first half 
            scatter(cue_CD_values(idx_cue_1), predicted_cue_cd_covar(idx_cue_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
          % CD Cues second half
            scatter(cue_CD_values(idx_cue_2), predicted_cue_cd_covar(idx_cue_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
          % Plot unity line
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);
            
        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Amplitude (µV)');
        end
    end
end

%% Figure 10: plots predicted models (w/covar) on the corresponding FEEDBACK scatterplots (split by half)

figure(10); clf;
sgtitle('Actual vs Predicted N200 mean amplitude during feedback (w/covar)')

condition_names = {'Negative Feedback','Positive Feedback'};
y_limits = [-8, 36];
x_limits = [-8, 36];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1); %oud sham
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1); %oud active 
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1); %control sham
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1); %control active
    end

    for cond_j = 1:2
        subplot_idx = (group_i - 1) * 2 + cond_j;
        subplot(4, 2, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        ylim(y_limits);
        yticks(y_limits(1):4:y_limits(2));
        xlim(x_limits);
        xticks(x_limits(1):4:x_limits(2));
        grid on;

        if cond_j == 1
            % --------- Negative Feedback ---------
            idx_neg_1 = group_idx & (neg_half == 1);
            idx_neg_2 = group_idx & (neg_half == 2);

            % Negative first half
            n_h1 = scatter(neg_values(idx_neg_1), predicted_fb_neg_covar(idx_neg_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on;
            % Negative second half
            n_h2 = scatter(neg_values(idx_neg_2), predicted_fb_neg_covar(idx_neg_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
            % Plot unity line
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

            if subplot_idx == 1
               legend([n_h1 n_h2],{'Half 1','Half 2'},'Location', 'best');
            end

         % --------- Positive Feeback ---------
        else  
            idx_pos_1 = group_idx & (pos_half == 1);
            idx_pos_2 = group_idx & (pos_half == 2);

             % Positive Half 1
            scatter(pos_values(idx_pos_1), predicted_fb_pos_covar(idx_pos_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
            hold on; 
            % Positive Half 2
            scatter(pos_values(idx_pos_2),predicted_fb_pos_covar(idx_pos_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
            plot(xlim, ylim, 'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Amplitude (µV)');
        end
    end
end