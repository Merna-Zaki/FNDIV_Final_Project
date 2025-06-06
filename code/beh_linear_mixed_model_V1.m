addpath ('/Users/School/Documents/GitHub/FNDIV_Final_project/data')
data= readtable ('data_file_V2.csv');
vn = {'Subject', 'TMS_group', 'OUD_group', 'age', 'gender', 'test_AB_acc', 'test_AB_RT', 'approach_A_acc', 'approach_A_RT', 'avoid_B_acc', 'avoid_B_RT'};
test_table = table(data.Subject, data.TMS_group, data.OUD_group, data.age, data.gender, data.test_AB_acc, data.test_AB_RT, data.approach_A_acc, data.approach_A_RT, data.avoid_B_acc, data.avoid_B_RT, 'VariableNames', vn);
test_table(76:end,:) = [];

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
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    % Cue H1 and H2 indices
    idx_H1 = group_idx & (data.beh_half == 1);
    idx_H2 = group_idx & (data.beh_half == 2);

    % Boxplot H1
    boxplot(data.Train_acc(idx_H1), 'positions', box_positions(2*i-1), ...
        'Widths', 0.7, 'Colors', 'k', 'Symbol', '');
    s1 = scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), ...
        data.Train_acc(idx_H1), 60, 'o', ...
        'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(data.Train_acc(idx_H2), 'positions', box_positions(2*i), ...
        'Widths', 0.7, 'Colors', 'k', 'Symbol', '');
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

figure(2); clf;
title('Reaction Time on training phase');
hold on;

for i = 1:4
    switch i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    % Cue H1 and H2 indices
    idx_H1 = group_idx & (data.beh_half == 1);
    idx_H2 = group_idx & (data.beh_half == 2);

    % Boxplot H1
    boxplot(data.Train_RT(idx_H1), 'positions', box_positions(2*i-1), ...
        'Widths', 0.7, 'Colors', 'k', 'Symbol', '');
    s1 = scatter(repmat(box_positions(2*i-1), sum(idx_H1), 1), ...
        data.Train_RT(idx_H1), 60, 'o', ...
        'MarkerEdgeColor', group_colors(i, :), 'MarkerFaceAlpha', 0.5);

    % Boxplot H2
    boxplot(data.Train_RT(idx_H2), 'positions', box_positions(2*i), ...
        'Widths', 0.7, 'Colors', 'k', 'Symbol', '');
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

%% Linear mixed-effects model

lme_rt = fitlme(data,'Train_RT ~ TMS_group * OUD_group * beh_half + (1|Subject)');
lme_acc = fitlme(data,'Train_acc ~ TMS_group * OUD_group * beh_half + (1|Subject)');

lme_ab_rt = fitlme(data,'Train_AB_RT ~ TMS_group * OUD_group * beh_half + (1|Subject)');
lme_ab_acc = fitlme(data,'Train_AB_acc ~ TMS_group * OUD_group * beh_half + (1|Subject)');

lme_cd_rt = fitlme(data,'Train_CD_RT ~ TMS_group * OUD_group * beh_half + (1|Subject)');
lme_cd_acc = fitlme(data,'Train_CD_acc ~ TMS_group * OUD_group * beh_half + (1|Subject)');

lme_app_A_rt = fitlme(test_table, 'approach_A_RT ~ TMS_group * OUD_group + (1|Subject)');
lme_app_A_acc = fitlme(test_table, 'approach_A_acc ~ TMS_group * OUD_group + (1|Subject)');

lme_avoid_B_rt = fitlme(test_table,'avoid_B_RT ~ TMS_group * OUD_group + (1|Subject)');
lme_avoid_B_acc = fitlme(test_table,'avoid_B_acc ~ TMS_group * OUD_group + (1|Subject)');

lme_test_rt= fitlme(test_table,'test_AB_RT ~ TMS_group * OUD_group + (1|Subject)');
lme_test_acc= fitlme(test_table, 'test_AB_acc ~ TMS_group * OUD_group + (1|Subject)');

%% Linear mixed-effects model- accounting for age & gender & GCR

lme_rt_covariates = fitlme(data,'Train_RT ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');
lme_acc_covariates = fitlme(data,'Train_acc ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');

lme_ab_rt_covariates = fitlme(data,'Train_AB_RT ~ TMS_group * OUD_group * beh_half +  gender + age +(1|Subject)');
lme_ab_acc_covariates = fitlme(data,'Train_AB_acc ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');

lme_cd_rt_covariates = fitlme(data,'Train_CD_RT ~ TMS_group * OUD_group * beh_half + gender + age + (1|Subject)');
lme_cd_acc_covariates = fitlme(data,'Train_CD_acc ~ TMS_group * OUD_group * beh_half + gender + age +(1|Subject)');

lme_app_A_rt_covariates = fitlme(test_table,'approach_A_RT ~ TMS_group * OUD_group + gender + age +(1|Subject)');
lme_app_A_acc_covariates = fitlme(test_table,'approach_A_acc ~ TMS_group * OUD_group + gender + age +(1|Subject)');

lme_avoid_B_rt_covariates= fitlme(test_table,'avoid_B_RT ~ TMS_group * OUD_group + gender + age + (1|Subject)');
lme_avoid_B_acc_covariates= fitlme(test_table,'avoid_B_acc ~ TMS_group * OUD_group + gender + age + (1|Subject)');

lme_test_rt_covariates= fitlme(test_table,'test_AB_RT ~ TMS_group * OUD_group + gender + age + (1|Subject)');
lme_test_acc_covariates= fitlme(test_table,'test_AB_acc ~ TMS_group * OUD_group + gender + age + (1|Subject)');

%% prediciting accuracy and RT values using the linear mixed models

% Predict from cue model w & w/o covariates
predicted_rt = predict(lme_rt, data);
predicted_acc = predict(lme_acc, data);

predicted_rt_covar = predict(lme_rt_covariates, data);
predicted_acc_covar = predict(lme_acc_covariates, data);

predicted_ab_rt = predict(lme_ab_rt, data);
predicted_ab_acc = predict(lme_ab_acc, data);

predicted_ab_rt_covar = predict(lme_ab_rt_covariates, data);
predicted_ab_acc_covar = predict(lme_ab_acc_covariates, data);

predicted_cd_rt = predict(lme_cd_rt, data);
predicted_cd_acc = predict(lme_cd_acc, data);

predicted_cd_rt_covar = predict(lme_cd_rt_covariates, data);
predicted_cd_acc_covar = predict(lme_cd_acc_covariates, data);

predicted_test_rt = predict(lme_test_rt, test_table);
predicted_test_acc = predict(lme_test_acc, test_table);

predicted_test_rt_covar = predict(lme_test_rt_covariates, test_table);
predicted_test_acc_covar = predict(lme_test_acc_covariates, test_table);

predicted_avoid_B_rt= predict(lme_avoid_B_rt, test_table);
predicted_avoid_B_acc= predict(lme_avoid_B_acc, test_table); 

predicted_avoid_B_rt_covar= predict(lme_avoid_B_rt_covariates, test_table);
predicted_avoid_B_acc_covar= predict(lme_avoid_B_acc_covariates, test_table);

predicted_app_A_rt= predict(lme_app_A_rt, test_table); 
predicted_app_A_acc= predict(lme_app_A_acc, test_table);

predicted_app_A_rt_covar= predict(lme_app_A_rt_covariates, test_table); 
predicted_app_A_acc_covar= predict(lme_app_A_acc_covariates, test_table); 

%% Figure 3: plots predicted models on the corresponding accuracy plots (training phase)

train= data.Train_acc;
train_ab= data.Train_AB_acc;
train_cd= data.Train_CD_acc;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Train', 'Train AB', 'Train CD'};

% Plot settings
figure(3); clf;
sgtitle('Actual vs predicted accuracy during Training phase')
xlim ([0.3 1]);
ylim ([0.3 1]);

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;

        grid on;

        if cond_j == 1
            % --------- train ---------
            idx_train_1 = group_idx & (data.beh_half == 1);
            idx_train_2 = group_idx & (data.beh_half == 2);

            % train Half 1
            t_h1 = scatter(train(idx_train_1), predicted_acc(idx_train_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
                   
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0.3 1], [0.3 1] ,'k--', 'LineWidth', 1.5);
            % train Half 2
            t_h2 = scatter(train(idx_train_2), predicted_acc(idx_train_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);

            if subplot_idx == 1
               legend([t_h1 t_h2],{'Half 1', 'Half 2'}, 'Location', 'best');
            end

             % --------- train AB ---------
        elseif cond_j == 2 
               idx_train_ab_1 = group_idx & (data.beh_half == 1);
               idx_train_ab_2 = group_idx & (data.beh_half == 2);

           % train AB Half 1
           scatter(train_ab(idx_train_ab_1), predicted_ab_acc(idx_train_ab_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([0.3 1], [0.3 1] ,'k--', 'LineWidth', 1.5);
           % train AB Half 2
           scatter(train_ab(idx_train_ab_2), predicted_ab_acc(idx_train_ab_1), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);

             % --------- train CD ---------
        else 

            idx_train_cd_1 = group_idx & (data.beh_half == 1);
            idx_train_cd_2 = group_idx & (data.beh_half == 2);

            % train CD Half 1
            scatter(train_cd(idx_train_cd_1), predicted_cd_acc(idx_train_cd_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0.3 1], [0.3 1] ,'k--', 'LineWidth', 1.5);

            % train CD Half 2
            scatter(train_cd(idx_train_cd_2), predicted_cd_acc(idx_train_cd_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);
        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Accuracy %');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [0.30, 1], 'XTick', 0.30:0.1:1 ,'YLim', [0.30, 1], 'YTick', 0.30:0.1:1);

%% Figure 4: plots predicted models on the corresponding RT plots (training phase)

train_rt= data.Train_RT;
train_ab_rt= data.Train_AB_RT;
train_cd_rt= data.Train_CD_RT;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Train', 'Train AB', 'Train CD'};

% Plot settings
figure(4); clf;
sgtitle('Actual vs predicted RT during Training phase')
xlim([200 2400]);
ylim([200 2400]);

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;
        grid on;

        if cond_j == 1
            % --------- train ---------
            idx_train_1 = group_idx & (data.beh_half == 1);
            idx_train_2 = group_idx & (data.beh_half == 2);

            % train Half 1
            t_h1 = scatter(train_rt(idx_train_1), predicted_rt(idx_train_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
                   
            hold on;
           % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400] ,'k--', 'LineWidth', 1.5);
            % train Half 2
            t_h2 = scatter(train_rt(idx_train_2), predicted_rt(idx_train_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);

            if subplot_idx == 1
               legend([t_h1 t_h2],{'Half 1', 'Half 2'}, 'Location', 'best');
            end

             % --------- train AB ---------
        elseif cond_j == 2 
               idx_train_ab_1 = group_idx & (data.beh_half == 1);
               idx_train_ab_2 = group_idx & (data.beh_half == 2);

           % train AB Half 1
           scatter(train_ab_rt(idx_train_ab_1), predicted_ab_rt(idx_train_ab_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);
           % train AB Half 2
           scatter(train_ab_rt(idx_train_ab_2), predicted_ab_rt(idx_train_ab_1), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);

             % --------- train CD ---------
        else 
            idx_train_cd_1 = group_idx & (data.beh_half == 1);
            idx_train_cd_2 = group_idx & (data.beh_half == 2);

            % train CD Half 1
            scatter(train_cd_rt(idx_train_cd_1), predicted_cd_rt(idx_train_cd_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);

            % train CD Half 2
            scatter(train_cd_rt(idx_train_cd_2), predicted_cd_rt(idx_train_cd_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);
        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Reaction Time (ms)');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [200, 2400], 'XTick', 200:400:2400, 'YLim', [200, 2400], 'YTick', 200:400:2400)

%% Figure 5: plots predicts models on corresponding testing phase accuracy plots 

testing_acc= test_table.test_AB_acc;
app_a= test_table.approach_A_acc;
avoid_B= test_table.avoid_B_acc;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Test', 'Approach A', 'Avoid B'};

% Plot settings
figure(5); clf;
sgtitle('Actual vs predicted accuracy during Testing phase')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == 1);
        case 2, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == 1);
        case 3, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == -1);
        case 4, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;
        grid on;

            % --------- Test AB ---------
        if cond_j == 1

            scatter(testing_acc(group_idx), predicted_test_acc(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis          
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0 1], [0 1] ,'k--', 'LineWidth', 1.5);

             % --------- Approach A ---------
        elseif cond_j == 2

           scatter(app_a(group_idx), predicted_app_A_acc(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([0 1], [0 1],'k--', 'LineWidth', 1.5);
        
             % --------- Avoid B ---------
        else 
            scatter(avoid_B(group_idx), predicted_avoid_B_acc(group_idx), ...
                     60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0 1], [0 1],'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Accuracy (%)');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [0, 1], 'XTick', 0:.2:1, 'YLim', [0, 1], 'YTick', 0:.2:1)

%% Figure 6: plots predicts models on corresponding testing phase RT plots

testing_rt= test_table.test_AB_RT;
app_a_rt= test_table.approach_A_RT;
avoid_B_rt= test_table.avoid_B_RT;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Test', 'Approach A', 'Avoid B'};

% Plot settings
figure(6); clf;
sgtitle('Actual vs predicted RT during Testing phase')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == 1);
        case 2, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == 1);
        case 3, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == -1);
        case 4, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;
        grid on;

            % --------- Test AB ---------
        if cond_j == 1
            scatter(testing_rt(group_idx), predicted_test_rt(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
                   
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);

             % --------- Approach A ---------

        elseif cond_j == 2
           scatter(app_a_rt(group_idx), predicted_app_A_rt(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);
        
             % --------- Avoid B ---------
        else 
            scatter(avoid_B_rt(group_idx), predicted_avoid_B_rt(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Reaction Time (ms)');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [200, 2400], 'XTick', 200:400:2400, 'YLim', [200, 2400], 'YTick', 200:400:2400)

%% Figure 7: plots predicts models on corresponding testing phase accuracy plots

testing_acc= test_table.test_AB_acc;
app_a= test_table.approach_A_acc;
avoid_B= test_table.avoid_B_acc;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Test', 'Approach A', 'Avoid B'};

% Plot settings
figure(7); clf;
sgtitle('Actual vs predicted accuracy during Testing phase (w/covar)')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == 1);
        case 2, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == 1);
        case 3, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == -1);
        case 4, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;
        grid on;

            % --------- Test AB ---------
        if cond_j == 1

            scatter(testing_acc(group_idx), predicted_test_acc_covar(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis          
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0 1], [0 1] ,'k--', 'LineWidth', 1.5);

             % --------- Approach A ---------
        elseif cond_j == 2

           scatter(app_a(group_idx), predicted_app_A_acc_covar(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([0 1], [0 1],'k--', 'LineWidth', 1.5);
        
             % --------- Avoid B ---------
        else 
            scatter(avoid_B(group_idx), predicted_avoid_B_acc_covar(group_idx), ...
                     60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0 1], [0 1],'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Accuracy (%)');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [0, 1], 'XTick', 0:.2:1, 'YLim', [0, 1], 'YTick', 0:.2:1)
%% Figure 8: plots predicted models w/ covariates on the corresponding RT plots (training phase)

train_rt= data.Train_RT;
train_ab_rt= data.Train_AB_RT;
train_cd_rt= data.Train_CD_RT;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Train', 'Train AB', 'Train CD'};

% Plot settings
figure(8); clf;
sgtitle('Actual vs predicted RT during Training phase (w/covar)')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (data.TMS_group == -1) & (data.OUD_group == 1);
        case 2, group_idx = (data.TMS_group == 1) & (data.OUD_group == 1);
        case 3, group_idx = (data.TMS_group == -1) & (data.OUD_group == -1);
        case 4, group_idx = (data.TMS_group == 1) & (data.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;
        grid on;

        if cond_j == 1
            % --------- train ---------
            idx_train_1 = group_idx & (data.beh_half == 1);
            idx_train_2 = group_idx & (data.beh_half == 2);

            % train Half 1
            t_h1 = scatter(train_rt(idx_train_1), predicted_rt_covar(idx_train_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
                   
            hold on;
           % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400] ,'k--', 'LineWidth', 1.5);
            % train Half 2
            t_h2 = scatter(train_rt(idx_train_2), predicted_rt_covar(idx_train_2), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);

            if subplot_idx == 1
               legend([t_h1 t_h2],{'Half 1', 'Half 2'}, 'Location', 'best');
            end

             % --------- train AB ---------
        elseif cond_j == 2 
               idx_train_ab_1 = group_idx & (data.beh_half == 1);
               idx_train_ab_2 = group_idx & (data.beh_half == 2);

           % train AB Half 1
           scatter(train_ab_rt(idx_train_ab_1), predicted_ab_rt_covar(idx_train_ab_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);
           % train AB Half 2
           scatter(train_ab_rt(idx_train_ab_2), predicted_ab_rt_covar(idx_train_ab_1), ...
                    60, 'o', 'MarkerEdgeColor', 'b' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);

             % --------- train CD ---------
        else 
            idx_train_cd_1 = group_idx & (data.beh_half == 1);
            idx_train_cd_2 = group_idx & (data.beh_half == 2);

            % train CD Half 1
            scatter(train_cd_rt(idx_train_cd_1), predicted_cd_rt_covar(idx_train_cd_1), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);

            % train CD Half 2
            scatter(train_cd_rt(idx_train_cd_2), predicted_cd_rt_covar(idx_train_cd_2), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.4);
        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Reaction Time (ms)');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [200, 2400], 'XTick', 200:400:2400, 'YLim', [200, 2400], 'YTick', 200:400:2400)

%% Figure 9: plots predicts models on corresponding testing phase accuracy plots

testing_acc= test_table.test_AB_acc;
app_a= test_table.approach_A_acc;
avoid_B= test_table.avoid_B_acc;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Test', 'Approach A', 'Avoid B'};

% Plot settings
figure(9); clf;
sgtitle('Actual vs predicted accuracy during Testing phase (w/covar)')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == 1);
        case 2, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == 1);
        case 3, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == -1);
        case 4, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;
        grid on;

            % --------- Test AB ---------
        if cond_j == 1

            scatter(testing_acc(group_idx), predicted_test_acc_covar(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis          
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0 1], [0 1] ,'k--', 'LineWidth', 1.5);

             % --------- Approach A ---------
        elseif cond_j == 2

           scatter(app_a(group_idx), predicted_app_A_acc_covar(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([0 1], [0 1],'k--', 'LineWidth', 1.5);
        
             % --------- Avoid B ---------
        else 
            scatter(avoid_B(group_idx), predicted_avoid_B_acc_covar(group_idx), ...
                     60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([0 1], [0 1],'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Accuracy (%)');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [0, 1], 'XTick', 0:.2:1, 'YLim', [0, 1], 'YTick', 0:.2:1)

%% Figure 10: plots predicts models on corresponding testing phase RT plots

testing_rt= test_table.test_AB_RT;
app_a_rt= test_table.approach_A_RT;
avoid_B_rt= test_table.avoid_B_RT;

% Define group labels and colors
group_labels = {'Sham+OUD', 'Active+OUD', 'Sham+HC', 'Active+HC'};
condition_names = {'Test', 'Approach A', 'Avoid B'};

% Plot settings
figure(10); clf;
sgtitle('Actual vs predicted RT during Testing phase (w/covar)')

for group_i = 1:4
    % Get group index
    switch group_i
        case 1, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == 1);
        case 2, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == 1);
        case 3, group_idx = (test_table.TMS_group == -1) & (test_table.OUD_group == -1);
        case 4, group_idx = (test_table.TMS_group == 1) & (test_table.OUD_group == -1);
    end

    for cond_j = 1:length(condition_names)
        subplot_idx = (group_i - 1) * 3 + cond_j;
        subplot(4, 3, subplot_idx);
        hold on;
        grid on;

            % --------- Test AB ---------
        if cond_j == 1
            scatter(testing_rt(group_idx), predicted_test_rt_covar(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
                   
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);

             % --------- Approach A ---------

        elseif cond_j == 2
           scatter(app_a_rt(group_idx), predicted_app_A_rt_covar(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % actual on the x-axis ad predicted on the y-axis
           hold on;
           % plot a line of unity to see how the model fits the data
           plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);
        
             % --------- Avoid B ---------
        else 
            scatter(avoid_B_rt(group_idx), predicted_avoid_B_rt_covar(group_idx), ...
                    60, 'o', 'MarkerEdgeColor', 'k' , 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.4); % Actual values (x = y)
            hold on;
            % plot a line of unity to see how the model fits the data
            plot([200 2400], [200 2400],'k--', 'LineWidth', 1.5);

        end

        % --- Titles and labels ---
        if group_i == 1
            title(condition_names{cond_j});
        end
        if cond_j == 1
            ylabel(group_labels{group_i});
        end
        if group_i == 4
            xlabel('Reaction Time (ms)');
        end
    end
end
set(findall(gcf,'type','axes'), 'XLim', [200, 2400], 'XTick', 200:400:2400, 'YLim', [200, 2400], 'YTick', 200:400:2400)




