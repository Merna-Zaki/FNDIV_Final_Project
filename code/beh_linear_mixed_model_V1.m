addpath ('/Users/School/Documents/GitHub/FNDIV_Final_project')
data= readtable ('data_file.csv');
%% Figure 1: Bar plots to showcase accuracy during the training phase

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
group_colors = lines(4);  % MATLAB’s color map with 4 distinct colors
box_positions = [1, 2, 4, 5, 7, 8, 10, 11];  % H1/H2 pairs for each group
x_positions= [1.5, 4.5, 7.5, 10.5]; % setting the position for the x-labels

figure(1);clf;
title('Accuracy on training phase');
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

    % Cue H1 and H2 indices
    idx_H1 = group_idx & (data.beh_half == 1);
    idx_H2 = group_idx & (data.beh_half == 2);

    % Boxplot H1
    boxplot(data.Train_acc(idx_H1), 'positions', box_positions(2*i-1), ...
        'Widths', 1, 'Colors', 'k', 'Symbol', '');
    s1 = scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), ...
        data.Train_acc(idx_H1), 60, 'o', ...
        'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(data.Train_acc(idx_H2), 'positions', box_positions(2*i), ...
        'Widths', 0.5, 'Colors', 'k', 'Symbol', '');
    s2 = scatter(repmat(box_positions(2*i), sum(idx_H2), 1), ...
        data.Train_acc(idx_H2), 60, '^', ...
        'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);
end

% Y-axis settings
ylim([0.35, 1]);
yticks(0.35:0.1:1);
ylabel('Accuracy (%)');

% X-axis settings
xticks(x_positions);
xticklabels(group_labels);

legend([s1, s2], {'Half 1', 'Half 2'}, 'Location', 'best');
grid on;

%% Figure 2:  Bar plots to showcase reaction time during the training phase

figure(2);clf;
title('Reaction Time on training phase');
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

    % Cue H1 and H2 indices
    idx_H1 = group_idx & (data.beh_half == 1);
    idx_H2 = group_idx & (data.beh_half == 2);

    % Boxplot H1
    boxplot(data.Train_RT(idx_H1), 'positions', box_positions(2*i-1), ...
        'Widths', 1, 'Colors', 'k', 'Symbol', '');
    s1 = scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), ...
        data.Train_RT(idx_H1), 60, 'o', ...
        'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(data.Train_RT(idx_H2), 'positions', box_positions(2*i), ...
        'Widths', 0.5, 'Colors', 'k', 'Symbol', '');
    s2 = scatter(repmat(box_positions(2*i), sum(idx_H2), 1), ...
        data.Train_RT(idx_H2), 60, '^', ...
        'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);
end

% Y-axis settings
ylim([200, 2400]);
yticks(200:200:2400);
ylabel('time (ms)');

% X-axis settings
xticks(x_positions);
xticklabels(group_labels);

legend([s1, s2], {'Half 1', 'Half 2'}, 'Location', 'best');
grid on;

%%
% --- Define Variables ---

OUD_active_rt= (data.Train_RT) & (data.TMS_group == 1) & (data.OUD_group == 1);
OUD_active_rt_H1= (data.Train_RT) & (data.TMS_group == 1) & (data.OUD_group == 1) & (data.beh_half == 1);
OUD_active_rt_H2= (data.Train_RT) & (data.TMS_group == 1) & (data.OUD_group == 1) & (data.beh_half== 2);

OUD_sham_rt= (data.Train_RT) & (data.TMS_group == -1) & (data.OUD_group == 1);
OUD_sham_rt_H1= (data.Train_RT) & (data.TMS_group == -1) & (data.OUD_group == 1) & (data.beh_half== 1);
OUD_sham_rt_H2= (data.Train_RT) & (data.TMS_group == -1) & (data.OUD_group == 1) & (data.beh_half== 2);

Ctrl_active_rt= (data.Train_RT) & (data.TMS_group == 1) & (data.OUD_group == -1);
Ctrl_active_rt_H1= (data.Train_RT) & (data.TMS_group == 1) & (data.OUD_group == -1) & (data.beh_half== 1);
Ctrl_active_rt_H2= (data.Train_RT) & (data.TMS_group == 1) & (data.OUD_group == -1) & (data.beh_half== 2);

Ctrl_sham_rt= (data.Train_RT) & (data.TMS_group == -1) & (data.OUD_group == -1);
Ctrl_sham_rt_H1= (data.Train_RT) & (data.TMS_group == -1) & (data.OUD_group == -1) & (data.beh_half== 1);
Ctrl_sham_rt_H2= (data.Train_RT) & (data.TMS_group == -1) & (data.OUD_group == -1) & (data.beh_half== 2);

%% Linear mixed-effects model

lme_rt = fitlme(data,'Train_RT ~ TMS_group * OUD_group * beh_half + (1|Subject)');
lme_acc = fitlme(data,'Train_acc ~ TMS_group * OUD_group * beh_half + (1|Subject)');

lme_ab_rt = fitlme(data,'Train_AB_RT ~ TMS_group * OUD_group * beh_half + (1|Subject)');
lme_ab_acc = fitlme(data,'Train_AB_acc ~ TMS_group * OUD_group * beh_half + (1|Subject)');

lme_cd_rt = fitlme(data,'Train_CD_RT ~ TMS_group * OUD_group * beh_half + (1|Subject)');
lme_cd_acc = fitlme(data,'Train_CD_acc ~ TMS_group * OUD_group * beh_half + (1|Subject)');

lme_app_A_rt = fitlme(data, 'approach_A_RT ~ TMS_group * OUD_group + (1|Subject)');
lme_app_A_acc = fitlme(data, 'approach_A_acc ~ TMS_group * OUD_group + (1|Subject)');

lme_avoid_B_rt = fitlme(data,'avoid_B_RT ~ TMS_group * OUD_group + (1|Subject)');
lme_avoid_B_acc = fitlme(data,'avoid_B_acc ~ TMS_group * OUD_group + (1|Subject)');

lme_test_rt= fitlme(data,'test_AB_RT ~ TMS_group * OUD_group + (1|Subject)');
lme_test_acc= fitlme(data, 'test_AB_acc ~ TMS_group * OUD_group + (1|Subject)');

%% Linear mixed-effects model- accounting for age & gender & GCR

lme_rt_covariates = fitlme(data,'Train_RT ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');
lme_acc_covariates = fitlme(data,'Train_acc ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');

lme_ab_rt_covariates = fitlme(data,'Train_AB_RT ~ TMS_group * OUD_group * beh_half +  gender + age +(1|Subject)');
lme_ab_acc_covariates = fitlme(data,'Train_AB_acc ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');

lme_cd_rt_covariates = fitlme(data,'Train_CD_RT ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');
lme_cd_acc_covariates = fitlme(data,'Train_CD_acc ~ TMS_group * OUD_group * beh_half + gender + age +(1|Subject)');

lme_app_A_rt_covariates = fitlme(data,'approach_A_RT ~ TMS_group * OUD_group + gender + age +(1|Subject)');
lme_app_A_acc_covariates = fitlme(data,'approach_A_acc ~ TMS_group * OUD_group + gender + age +(1|Subject)');

lme_avoid_B_rt_covariates= fitlme(data,'avoid_B_RT ~ TMS_group * OUD_group + gender + age + (1|Subject)');
lme_avoid_B_acc_covariates= fitlme(data,'avoid_B_acc ~ TMS_group * OUD_group + gender + age + (1|Subject)');

lme_test_rt_covariates= fitlme(data,'test_AB_RT ~ TMS_group * OUD_group + gender + age + (1|Subject)');
lme_test_acc_covariates= fitlme(data,'test_AB_acc ~ TMS_group * OUD_group + gender + age + (1|Subject)');

%% prediciting accuracy and RT values using the linear mixed models

% Predict from cue model w & w/o covariates
predicted_rt = predict(lme_rt, data);
predicted_acc = predict(lme_acc, data);

predicted_ab_rt = predict(lme_ab_rt, data);
predicted_ab_acc = predict(lme_ab_acc, data);

predicted_cd_rt = predict(lme_cd_rt, data);
predicted_cd_acc = predict(lme_cd_acc, data);

predicted_test_rt = predict(lme_test_rt, data);
predicted_test_acc = predict(lme_test_acc, data);

%% Figure 3: plots predicted models on the corresponding accuracy plots

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Train', 'Train AB', 'Train CD'};
%ylim([0.35, 1]);
%yticks(0.35:0.05:1);
grid on;

% Plot settings
figure(3); clf;
sgtitle('Accuracy during Training phase')

train= data.Train_acc;
train_H1 = (data.beh_half == 1) & (data.Train_acc);
train_H2 = (data.beh_half == 2) & (data.Train_acc);
testing_acc= data.test_AB_acc;

train_ab= data.Train_AB_acc;
train_ab_H1 = (data.beh_half == 1) & (data.Train_AB_acc);
train_ab_H2 = (data.beh_half == 2) & (data.Train_AB_acc);

train_cd= data.Train_CD_acc;
train_cd_H1 = (data.beh_half == 1) & (data.Train_CD_acc);
train_cd_H2 = (data.beh_half == 2) & (data.Train_CD_acc);


for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    for cond_j = 1:3
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;

        % Set consistent y-axis and grid
        %ylim();
        %yticks(y_limits(1):0.1:y_limits(2));
        grid on;

        if cond_j == 1
            % --------- train ---------
            idx_train_1 = group_idx & (data.beh_half == 1);
            idx_train_2 = group_idx & (data.beh_half == 2);

            train1 = sum(idx_train_1);
            train2 = sum(idx_train_2);

            % train Half 1
            t_h1 = scatter(train(idx_train_1), train(idx_train_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
                    hold on;
            m1 = scatter(train(idx_train_1), predicted_acc(idx_train_1), ...
                    60, '*', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', 0.6);  % Predicted

            % train Half 2
            t_h2 = scatter(train(idx_train_2), train(idx_train_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
            m2 = scatter(train(idx_train_2), predicted_acc(idx_train_2), ...
                    60, '*', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', 0.6);  % Predicted

            if subplot_idx == 1
               legend([t_h1 m1 t_h2 m2],{'Half 1 - actual', 'Half 1 - predicted', 'Half 2 - actual', 'Half 2 - predicted'}, ...
                'Location', 'best');
            end

             % --------- train AB ---------
        elseif cond_j == 2 
               idx_train_ab_1 = group_idx & (data.beh_half == 1);
               idx_train_ab_2 = group_idx & (data.beh_half == 2);

             % train AB Half 1
            t_ab_h1 = scatter(train_ab(idx_train_ab_1), train_ab(idx_train_ab_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
                    hold on;
                    scatter(train_ab(idx_train_ab_1), predicted_ab_acc(idx_train_ab_1), ...
                    60, '*', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', 0.6);  % Predicted

            % train AB Half 2
            t_ab_h2 = scatter(train_ab(idx_train_ab_2), train_ab(idx_train_ab_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
                    scatter(train_ab(idx_train_ab_2), predicted_ab_acc(idx_train_ab_1), ...
                    60, '*', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', 0.6);  % Predicted

             % --------- train CD ---------
        else 
            idx_train_cd_1 = group_idx & (data.beh_half == 1);
            idx_train_cd_2 = group_idx & (data.beh_half == 2);

            % train CD Half 1
            t_cd_h1 = scatter(train_cd(idx_train_cd_1), train_cd(idx_train_cd_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4);  % Actual values (x = y)
                    hold on;
                    scatter(train_cd(idx_train_cd_1), predicted_cd_acc(idx_train_cd_1), ...
                    60, '*', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', 0.6);  % Predicted

            % train CD Half 2
            t_cd_h2 = scatter(train_cd(idx_train_cd_2), train_cd(idx_train_cd_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);  % Actual
                    scatter(train_cd(idx_train_cd_2), predicted_cd_acc(idx_train_cd_2), ...
                    60, '*', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', 0.6);  % Predicted

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
set(findall(gcf,'type','axes'), 'YLim', [0.30, 1], 'YTick', 0.30:0.1:1);

%% Figure 4: plots predicted models on the corresponding RT plots

