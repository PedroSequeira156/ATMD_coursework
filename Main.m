clear all 
close all

% change
%aaaaaaaaaaaaaaaaa
%% Read Data %%
%gfgfgf
Propellant_Data = readtable('Data.xlsx','Sheet','Propellant Data');
Engine_Data = readtable('Data.xlsx','Sheet','Engine Data');

%% Initial Generations %%
n_Stage = 3;

% randomising the choice of initial generation
%x0 = randi([1,height(Engine_Data)],1,n_Stage);

% setting an initial generation (to make sure everything is good)]
x0 = [14,14,14];
%% Functions %%

[Mass_Stage,Prop_Stage, Mass_Total] = Mass(Engine_Data,x0);
[Delta_V, Delta_V_tot] = Propulsion(Engine_Data,Mass_Stage,Prop_Stage, Mass_Total,x0,n_Stage);
[Cost_Stage, Cost_Total] = Finance(Mass_Stage,n_Stage);
