% Main script for Power Network Analysis
% Initialize workspace
addpath(genpath(fullfile(cd, 'Functions')));
close all; fclose('all'); clear; clc; rng(100);

% Create result folder
resultPath = setupResultFolder();

% Add necessary paths
addpath(genpath(fullfile(cd, 'Functions')));

% Load and analyze IEEE-30 Network
analyzeNetwork('ieee30Bus.txt', resultPath, 'ieee30');

% Load and analyze Nigerian 30-Bus Network
analyzeNetwork('naija30bus.txt', resultPath, 'naija30');
