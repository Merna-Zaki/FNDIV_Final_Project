addpath ('/Users/School/Documents/GitHub/FNDIV_Final_Project')
data = readtable('data_file.csv'); %imports data csv file
%% Figure 1: Bar plots to showcase each subject's N200 mean amp during cue h1 vs cue h2

% Extract variables
cue_values = data.Cz_Cue;
cue_AB_values = data.Cz_Cue_AB;
cue_CD_values = data.Cz_Cue_CD;
cue_half = data.Cue_half;
TMS = data.TMS_group;
OUD = data.OUD_group;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Cue', 'Cue AB', 'Cue CD'};
y_limits = [-12, 9];

% Plot settings
figure(1); clf;
sgtitle('N200 mean amplitude during cue')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (TMS == -1) & (OUD == 1);
        case 2, group_idx = (TMS == 1) & (OUD == 1);
        case 3, group_idx = (TMS == -1) & (OUD == -1);
        case 4, group_idx = (TMS == 1) & (OUD == -1);
    end

    % Get subject data
    for cond_j = 1:3
        switch cond_j
            case 1, cue_vals = cue_values;
            case 2, cue_vals = cue_AB_values;
            case 3, cue_vals = cue_CD_values;
        end

        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;

        % Plot each subject's bar separately
        idx_H1 = group_idx & (cue_half == 1);
        idx_H2 = group_idx & (cue_half == 2);

        c_H1 = sum(idx_H1);
        c_H2 = sum(idx_H2);

        % Plot Cue Half 1
        bar(1:c_H1, cue_vals(idx_H1), 0.4, 'FaceColor', 'g', 'EdgeColor', 'k');

        % Plot Cue Half 2 (shifted to right of half 1 bars)
        bar(c_H1+2:c_H1+1+c_H2, cue_vals(idx_H2), 0.4, ...
            'FaceColor', 'm ', 'EdgeColor', 'k');

        ylim(y_limits);
        yticks(-12:3:9);
        title(condition_names{cond_j});
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Subjects');
        end
        if subplot_idx == 1
            legend({'Cue Half 1', 'Cue Half 2'}, 'Location', 'northeast');
        end
        grid on;
    end
end

%% Figure 2: Bar plots to showcase each subject's N200 mean amp during positive & negative feedback

% Extract variables
neg_vals = data.Cz_Neg;
neg_half = data.Neg_half;
pos_vals = data.Cz_Pos;
pos_half = data.Pos_half;

% Define group labels and settings
condition_names = {'Positive Feedback', 'Negative Feedback'};
y_limits = [-8, 36];

% Plot settings
figure(2); clf;
sgtitle('N200 mean amplitude during feedback')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (TMS == -1) & (OUD == 1);
        case 2, group_idx = (TMS == 1) & (OUD == 1);
        case 3, group_idx = (TMS == -1) & (OUD == -1);
        case 4, group_idx = (TMS == 1) & (OUD == -1);
    end

    % ------- Positive Feedback -------
    subplot(4, 2, (group_i - 1) * 2 + 1); %this calculates the index to plot positive feedback [subplots 1,3,5,7]
    hold on;

    idx_p1 = group_idx & (pos_half == 1);
    idx_p2 = group_idx & (pos_half == 2);

    p1 = sum(idx_p1);
    p2 = sum(idx_p2);

    % Plot half 1 (light blue)
    bar(1:p1, pos_vals(idx_p1), 0.4, 'FaceColor', [0.3010 0.7450 0.9330], 'EdgeColor', 'k'); %x-axis index. start at 1 and end with the last subject found in positive half 1 (p1)

    % Plot half 2 (dark blue)
    bar(p1+2:p1+1+p2, pos_vals(idx_p2), 0.4, 'FaceColor', 'b' , 'EdgeColor', 'k'); % x-axis index. start where you left off and leave 2 more spaces (p1+2) up to the last subject in half 2 (p2)

    title(condition_names{1});
    ylabel(group_labels{group_i});
    ylim(y_limits);
    yticks(-8:4:36);
    grid on;

    if group_i == 4
        xlabel('Subjects');
    end

    if group_i == 1
        legend({'Positive Half 1', 'Positive Half 2'}, 'Location', 'northeast');
    end

    % ------- Negative Feedback -------
    subplot(4, 2, (group_i - 1) * 2 + 2); %this calculates the index to plot negative feedback [subplots 2,4,6,8]
    hold on;

    idx_n1 = group_idx & (neg_half == 1);
    idx_n2 = group_idx & (neg_half == 2);

    n1 = sum(idx_n1);
    n2 = sum(idx_n2);

    % Plot half 1 (light red)
    bar(1:n1, neg_vals(idx_n1), 0.4, 'FaceColor', 'r' , 'EdgeColor', 'k');

    % Plot half 2 (dark red)
    bar(n1+2:n1+1+n2, neg_vals(idx_n2), 0.4, 'FaceColor', [0.6350 0.0780 0.1840], 'EdgeColor', 'k');

    title(condition_names{2});
    ylim(y_limits);
    yticks(-8:4:36);
    grid on;

    if group_i == 4
        xlabel('Subjects');
    end

    if group_i == 1
        legend({'Negative Half 1', 'Negative Half 2'}, 'Location', 'northeast');
    end
end

%% Linear mixed-effects model

lme_Cue = fitlme(data,'Cz_Cue ~ TMS_group * OUD_group * Cue_half + (1|Subject)');
lme_Cue_AB = fitlme(data,'Cz_Cue_AB ~ TMS_group * OUD_group * Cue_AB_half + (1|Subject)');
lme_Cue_CD = fitlme(data,'Cz_Cue_CD ~ TMS_group * OUD_group * Cue_CD_half + (1|Subject)');
lme_Fb_P = fitlme(data,'Cz_Pos ~ TMS_group * OUD_group * Pos_half + (1|Subject)');
lme_Fb_N = fitlme(data,'Cz_Neg ~ TMS_group * OUD_group * Neg_half + (1|Subject)');

%% Linear mixed-effects model- accounting for age & gender & GCR

lme_Cue_covariates = fitlme(data, 'Cz_Cue ~ TMS_group * OUD_group * Cue_half + gender + age + GCR + (1|Subject)'); 
lme_Cue_AB_covariates = fitlme(data,'Cz_Cue_AB ~ TMS_group * OUD_group * Cue_AB_half + gender + age + GCR + (1|Subject)');
lme_Cue_CD_covariates = fitlme(data,'Cz_Cue_CD ~ TMS_group * OUD_group * Cue_CD_half + gender + age + GCR + (1|Subject)');
lme_Fb_P_covariates = fitlme(data,'Cz_Pos ~ TMS_group * OUD_group * Pos_half + gender + age + GCR +(1|Subject)');
lme_Fb_N_covariates = fitlme(data,'Cz_Neg ~ TMS_group * OUD_group * Neg_half + gender + age + GCR +(1|Subject)');

%% printing fixed effect of TMS variable on Cue on cue, positive, and negative feedback

effectName1 = 'TMS_group';

% Find effect on Cue
row = find(strcmp(effectName1,lme_Cue_covariates.CoefficientNames));
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f] \n', ...
    effectName1,lme_Cue_covariates.Coefficients.Estimate(row),lme_Cue_covariates.Coefficients.Lower(row),lme_Cue_covariates.Coefficients.Upper(row))

% Running ANOVA (cue)
alpha =0.05;
if lme_Cue_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName1,not,lme_Cue_covariates.anova.DF1(row),lme_Cue_covariates.anova.DF2(row),lme_Cue_covariates.anova.FStat(row),lme_Cue_covariates.anova.pValue(row))

% Find effect on positive feedback
row = find(strcmp(effectName1,lme_Fb_P_covariates.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName1,lme_Fb_P_covariates.Coefficients.Estimate(row),lme_Fb_P_covariates.Coefficients.Lower(row),lme_Fb_P_covariates.Coefficients.Upper(row))

% Running ANOVA (positive feedback)
alpha =0.05;
if lme_Fb_P_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName1,not,lme_Fb_P_covariates.anova.DF1(row),lme_Fb_P_covariates.anova.DF2(row),lme_Fb_P_covariates.anova.FStat(row),lme_Fb_P_covariates.anova.pValue(row))

% Find effect on negative feedback
row = find(strcmp(effectName1,lme_Fb_N_covariates.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName1,lme_Fb_N_covariates.Coefficients.Estimate(row),lme_Fb_N_covariates.Coefficients.Lower(row),lme_Fb_N_covariates.Coefficients.Upper(row))

% Running ANOVA (negative feedback)
alpha =0.05;
if lme_Fb_N_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName1,not,lme_Fb_N_covariates.anova.DF1(row),lme_Fb_N_covariates.anova.DF2(row),lme_Fb_N_covariates.anova.FStat(row),lme_Fb_N_covariates.anova.pValue(row))

%% printing fixed effect of OUD on cue, positive, and negative feedback

effectName2 = 'OUD_group';

% Find effect on Cue
row = find(strcmp(effectName2,lme_Cue_covariates.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName2,lme_Cue_covariates.Coefficients.Estimate(row),lme_Cue_covariates.Coefficients.Lower(row),lme_Cue_covariates.Coefficients.Upper(row))

% Running ANOVA (cue)
alpha =0.05;
if lme_Cue_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName2,not,lme_Cue_covariates.anova.DF1(row),lme_Cue_covariates.anova.DF2(row),lme_Cue_covariates.anova.FStat(row),lme_Cue_covariates.anova.pValue(row))

% Find effect on positive feedback
row = find(strcmp(effectName2,lme_Fb_P_covariates.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName2,lme_Fb_P_covariates.Coefficients.Estimate(row),lme_Fb_P_covariates.Coefficients.Lower(row),lme_Fb_P_covariates.Coefficients.Upper(row))

% Running ANOVA (positive feedback)
alpha =0.05;
if lme_Fb_P_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName2,not,lme_Fb_P_covariates.anova.DF1(row),lme_Fb_P_covariates.anova.DF2(row),lme_Fb_P_covariates.anova.FStat(row),lme_Fb_P_covariates.anova.pValue(row))

% Find effect on negative feedback
row = find(strcmp(effectName2,lme_Fb_N_covariates.CoefficientNames)); 
fprintf('The (fixed) effect of %s was %3.3f (CI: [%3.3f,%3.3f]) \n', ...
    effectName2,lme_Fb_N_covariates.Coefficients.Estimate(row),lme_Fb_N_covariates.Coefficients.Lower(row),lme_Fb_N_covariates.Coefficients.Upper(row))

% Running ANOVA (negative feedback)
alpha =0.05;
if lme_Fb_N_covariates.anova.pValue(row)>alpha
    not='not';
else
    not = '';
end
fprintf('The (fixed) effect of %s was %s significantly different from zero: F(%d,%d) = %3.2f (p = %3.3g) \n', ...
    effectName2,not,lme_Fb_N_covariates.anova.DF1(row),lme_Fb_N_covariates.anova.DF2(row),lme_Fb_N_covariates.anova.FStat(row),lme_Fb_N_covariates.anova.pValue(row))


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

%% Figure 3: plots predicted models on the corresponding CUE bar plots

figure(3); clf;
sgtitle('N200 mean amplitude during cue with models')

condition_names = {'Cue','Cue AB', 'Cue CD'};
y_limits = [-12, 9];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (TMS == -1) & (OUD == 1);
        case 2, group_idx = (TMS == 1) & (OUD == 1);
        case 3, group_idx = (TMS == -1) & (OUD == -1);
        case 4, group_idx = (TMS == 1) & (OUD == -1);
    end

    for cond_j = 1:3
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        ylim(y_limits);
        yticks(y_limits(1):3:y_limits(2));
        grid on;

        if cond_j == 1
            % --------- CUE ---------
            idx_cue_1 = group_idx & (cue_half == 1);
            idx_cue_2 = group_idx & (cue_half == 2);

            cue1 = sum(idx_cue_1);
            cue2 = sum(idx_cue_2);

            b1 = bar(1:cue1, cue_values(idx_cue_1), 0.4, 'FaceColor','g', 'EdgeColor', 'k');
            b2= bar(cue1+2:cue1+1+cue2, cue_values(idx_cue_2), 0.4, 'FaceColor', 'm' , 'EdgeColor', 'k');

            % Model lines
            x1 = 1:cue1; x2 = cue1+2:cue1+1+cue2;
            plot(x1, predicted_cue(idx_cue_1), '-', 'Color', 'k', 'LineWidth', 2);
            plot(x2, predicted_cue(idx_cue_2), '-', 'Color', 'k', 'LineWidth', 2);
            plot(x1, predicted_cue_covar(idx_cue_1), '--', 'Color', 'y', 'LineWidth', 2);
            plot(x2, predicted_cue_covar(idx_cue_2), '--', 'Color', 'y', 'LineWidth', 2);

            l1 = plot(nan, nan, '-', 'Color', 'k', 'LineWidth', 2);
            l2 = plot(nan, nan, '--', 'Color', 'y', 'LineWidth', 2);

            if subplot_idx == 1
               legend([b1 b2 l1 l2],{'Half 1', 'Half 2', 'Model: Feedback Only', 'Model: Feedback + Covariates'}, ...
                'Location', 'best');
            end

        elseif cond_j == 2
            % --------- CUE AB ---------
            idx_ab_1 = group_idx & (cue_half == 1);
            idx_ab_2 = group_idx & (cue_half == 2);

            ab1 = sum(idx_ab_1);
            ab2 = sum(idx_ab_2);

            bar(1:ab1, cue_AB_values(idx_ab_1), 0.4, 'FaceColor','g', 'EdgeColor', 'k');
            bar(ab1+2:ab1+1+ab2, cue_AB_values(idx_ab_2), 0.4, 'FaceColor', 'm' , 'EdgeColor', 'k');

            x1 = 1:ab1; x2 = ab1+2:ab1+1+ab2;
            plot(x1, predicted_cue_ab(idx_ab_1), '-', 'Color', 'k', 'LineWidth', 2);
            plot(x2, predicted_cue_ab(idx_ab_2), '-', 'Color', 'k', 'LineWidth', 2);
            plot(x1, predicted_cue_ab_covar(idx_ab_1), '--', 'Color', 'y', 'LineWidth', 2);
            plot(x2, predicted_cue_ab_covar(idx_ab_2), '--', 'Color', 'y', 'LineWidth', 2);

        else
            % --------- CUE CD ---------
            idx_cd_1 = group_idx & (cue_half == 1);
            idx_cd_2 = group_idx & (cue_half == 2);

            cd1 = sum(idx_cd_1);
            cd2 = sum(idx_cd_2);

            bar(1:cd1, cue_CD_values(idx_cd_1), 0.4, 'FaceColor','g', 'EdgeColor', 'k');
            bar(cd1+2:cd1+1+cd2, cue_CD_values(idx_cd_2), 0.4, 'FaceColor', 'm' , 'EdgeColor', 'k');

            x1 = 1:cd1; x2 = cd1+2:cd1+1+cd2;
            plot(x1, predicted_cue_cd(idx_cd_1), '-', 'Color', 'k', 'LineWidth', 2);
            plot(x2, predicted_cue_cd(idx_cd_2), '-', 'Color', 'k', 'LineWidth', 2);
            plot(x1, predicted_cue_cd_covar(idx_cd_1), '--', 'Color', 'y', 'LineWidth', 2);
            plot(x2, predicted_cue_cd_covar(idx_cd_2), '--', 'Color', 'y', 'LineWidth', 2);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Subjects');
        end
    end
end

%% Figure 4: plots predicted models on the corresponding FEEDBACK bar plots

figure(4); clf;
sgtitle('N200 mean amplitude during feedback with models')

condition_names = {'Positive feedback', 'Negative feedback'};
y_limits = [-8, 36];

for group_i = 1:4
    switch group_i
        case 1, group_idx = (TMS == -1) & (OUD == 1);
        case 2, group_idx = (TMS == 1) & (OUD == 1);
        case 3, group_idx = (TMS == -1) & (OUD == -1);
        case 4, group_idx = (TMS == 1) & (OUD == -1);
    end

    for cond_j = 1:2
        subplot_idx = (group_i - 1) * 2 + cond_j;
        subplot(4, 2, subplot_idx);
        hold on;

        if cond_j == 1
            % --------- POSITIVE FEEDBACK ---------
            idx_p1 = group_idx & (pos_half == 1);
            idx_p2 = group_idx & (pos_half == 2);
            p1 = sum(idx_p1);
            p2 = sum(idx_p2);

            bar(1:p1, pos_vals(idx_p1), 0.4, 'FaceColor','b', 'EdgeColor', 'k');
            bar(p1+2:p1+1+p2, pos_vals(idx_p2), 0.4, 'FaceColor', [0.3010 0.7450 0.9330], 'EdgeColor', 'k');

            % ---- PLOT MODEL LINES for POSITIVE feedback ----
            pred_pos_y1 = predicted_fb_pos(idx_p1);
            pred_pos_y2 = predicted_fb_pos(idx_p2);
            pred_pos_covar_y1 = predicted_fb_pos_covar(idx_p1);
            pred_pos_covar_y2 = predicted_fb_pos_covar(idx_p2);

            x1 = 1:p1;
            x2 = p1+2:p1+1+p2;

            offset= 0.05; % adds jitter to see 2 distinct line
            plot(x1, pred_pos_y1, '-', 'Color', 'k', 'LineWidth', 2); % main model
            plot(x2, pred_pos_y2, '-', 'Color', 'k', 'LineWidth', 2);
            plot(x1, pred_pos_covar_y1, '--', 'Color', 'y', 'LineWidth', 2); % covariate model
            plot(x2, pred_pos_covar_y2, '--', 'Color', 'y', 'LineWidth', 2);
            grid on;

        else
            % --------- NEGATIVE FEEDBACK ---------
            idx_n1 = group_idx & (neg_half == 1);
            idx_n2 = group_idx & (neg_half == 2);
            n1 = sum(idx_n1);
            n2 = sum(idx_n2);

            bar(1:n1, neg_vals(idx_n1), 0.4, 'FaceColor', 'r', 'EdgeColor', 'k');
            bar(n1+2:n1+1+n2, neg_vals(idx_n2), 0.4, 'FaceColor', [0.6350 0.0780 0.1840], 'EdgeColor', 'k');

            % ---- PLOT MODEL LINES for NEGATIVE feedback ----
            pred_neg_y1 = predicted_fb_neg(idx_n1);
            pred_neg_y2 = predicted_fb_neg(idx_n2);
            pred_neg_covar_y1 = predicted_fb_neg_covar(idx_n1);
            pred_neg_covar_y2 = predicted_fb_neg_covar(idx_n2);

            x1 = 1:n1;
            x2 = n1+2:n1+1+n2;

            plot(x1, pred_neg_y1, '-', 'Color', 'k', 'LineWidth', 2); % main model
            plot(x2, pred_neg_y2, '-', 'Color', 'k', 'LineWidth', 2);
            plot(x1, pred_neg_covar_y1, '--', 'Color', 'y', 'LineWidth', 2); % covariate model
            plot(x2, pred_neg_covar_y2, '--', 'Color', 'y', 'LineWidth', 2);
        end

        ylim(y_limits);
        yticks(-8:4:36);
        title(condition_names{cond_j});
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Subjects');
        end

        if subplot_idx == 2
        % Dummy handles for accurate legend
            b1 = bar(nan, nan, 'FaceColor','r'); % Negative bar
            b2 = bar(nan, nan, 'FaceColor', 'b'); % Positive bar
            l1 = plot(nan, nan, '-', 'Color', 'k', 'LineWidth', 2);  % Main model
            l2 = plot(nan, nan, '--', 'Color', 'y', 'LineWidth', 2); % Covariate model

    legend([b1 b2 l1 l2], ...
        {'Negative Feedback', 'Positive Feedback', ...
         'Model: Feedback Only', 'Model: Feedback + Covariates'}, ...
        'Location', 'northeast');
        end

   end
grid on;
end
%%