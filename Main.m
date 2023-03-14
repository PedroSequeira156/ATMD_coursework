clear all 
close all

%% Read Data %%
% test push
Propellant_Data = readtable('Data.xlsx','Sheet','Propellant Data');
Engine_Data = readtable('Data.xlsx','Sheet','Engine Data');

%% Initial Generations %%
n_Stage = 3;

x0 = randi([1,18],5,n_Stage);

%% Functions %%

[Mass_Stage, Mass_Total] = Mass(Engine_Data,x0);
[Delta_V, Delta_V_tot] = Propulsion(Engine_Data,Mass_Stage,Mass_Total,x0,n_Stage);
[Cost_Stage, Cost_Total] = Finance(Mass_Stage,n_Stage);
