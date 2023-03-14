function [Cost_Stage, Cost_Total] = Finance(Mass_Stage,n_Stage)

%% Inputs %%

k3 = [15 17 19 21];
k4 = 0.253*(10^(-5));
C_min = 1;
lb_2_Kg = 0.453592;

%% Cost %%  I dont think it should be mass stage here, it should be mass of the engine
Cost_Stage = (C_min + k3(1:n_Stage).*exp(-k4.*Mass_Stage))*lb_2_Kg.*Mass_Stage;
Cost_Total = sum(Cost_Stage,2);