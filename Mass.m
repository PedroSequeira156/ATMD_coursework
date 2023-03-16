function [Mass_Stage, Mass_Total] = Mass(Engine_Data, x0)

%% Code %%
Mass_Payload = 1250;

Mass_Stage = Engine_Data.Mass(x0);
Mass_Total = sum(Mass_Stage,2) + Mass_Payload;