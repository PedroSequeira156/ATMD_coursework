function [Cost_Stage, Cost_Total] = Finance(Mass_Stage_Empty,n_Stage)

%% Inputs %%

k3 = [15 17 19 21];
k4 = 0.253*(10^(-5));
C_min = 1;
lb_2_Kg = 0.453592;
Kg_2_lb =2.20462;
Mass_Stage_lb = Mass_Stage_Empty.*Kg_2_lb;
%% Cost %%

Cost_Stage = (C_min + k3(1:n_Stage).*exp(-k4.*Mass_Stage_lb)).*Mass_Stage_lb;
Cost_Total = sum(Cost_Stage,2);