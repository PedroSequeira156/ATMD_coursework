function [M_Stage_Empty, Mass_Stage_Fuel, Mass_Total] = Mass(Engine_Data, x0,n_Stage)


% constants
Mass_Payload = 1250;
FR_Max = 0.95;
k1 = [0.5917 0.4917 0.3917 0.2917];
k2 = 0.29;
lb_2_Kg = 0.453592;
Kg_2_lb =2.20462;


% dry mass
M_Stage_Empty = Engine_Data.Mass(x0); 




%% Mass Fraction Per Stage %% relatively to dry mass (mass of engine)

FR = FR_Max - k1(1:n_Stage).*((M_Stage_Empty.*Kg_2_lb).^(-k2));

% this was wrong bcause mass of propellent is not equal to fraction * dry mass
% Mass_Fuel = FR.*Mass_Stage

% The fraction is not of M_propellent/M_Stage_Empty, otherwise the value would
% not be under 1, it would be much larger than 10. Therefore the fraction
% must be of M_prop/M_stage_tot, with some algebra you get the equation below:
Mass_Stage_Fuel = FR.*M_Stage_Empty./(1-FR);

% total mass
Mass_Total = sum(M_Stage_Empty,2) + sum(Mass_Stage_Fuel,2) + Mass_Payload;
