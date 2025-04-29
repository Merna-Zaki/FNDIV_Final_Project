# FNDIV_Final_Project

This repository contains MATLAB scripts to analyze event-related potential (ERP) data, specifically focusing on the N200 component, a neural marker of conflict monitoring and learning. The analysis explores how Transcranial Magnetic Stimulation (TMS) and Opioid Use Disorder (OUD) influence neural responses during a probabilistic selection task (PST).


## Requirement

MATLAB 2024b

Statistics and Machine Learning Toolbox

All scripts rely on exported preprocessed EEG data saved as a csv file. 

Preprocessing was performed in _Brain Vision Analyzer 2.3_ and includes:

• Interpolation of noisy channels or removal of bad channels (if necessary)
• IIR Filtering: 0.1–20 Hz, notch filter: 60 Hz
•	Re-referencing
•	Ocular Correction
•	Baseline Correction: -200ms -0 ms
•	Artifact Rejection
•	Segmentation of relevant ERP time windows: -200ms -600ms
•	Averaged trials

Make sure your dataset uses the same variable names as expected in the scripts (e.g., `data.Cz_Cue`, `data.Cue_half`, etc.).

## Repository contents

`Plotting_ERP.m` - Plots grand average ERPs from two channels across four experimental groups and four task conditions. (USED FOR FINAL PROJECT)

`ERP_linear_mixed_models_V2.m`- Runs linear mixed models for each condition to evaluate the effect of Transcranial Magnetic Stimulation (TMS) and Opioid Use Disorder (OUD) on the N200- an event-related potential (ERP) linked to conflict monitoring and learning. Visualizes mean amplitudes with bar graphs and overlays the predicted model.

`ERP_linear_mixed_models_V3.m`- Same statistical analysis as V2 but visualizes using boxplots for mean amplitudes and scatterplots for actual vs. predicted values. (USED FOR FINAL PROJECT)

### Customize if Needed **

All groups, conditions, and channels are customizable.

Update file paths and names in the first 2 lines (if necessary)
