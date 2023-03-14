function [Mass_Stage,Prop_Stage, Mass_Total] = Mass(Engine_Data, x0)

Mass_Payload = 1250;

Mass_Stage_engine  = Engine_Data.Mass(x0);


%% empirical constants
Sigma_max   = 0.95;
k2          = 0.29;
k1          = [0.5917, 0.4917, 0.3917, 0.2917];

%% Mass Fraction Per Stage %%
Prop_mass_frac = Sigma_max - ((Mass_Stage_engine).^(-k2)').*k1(1:length(x0));
Prop_Stage = Prop_mass_frac.*(Mass_Stage_engine');

Mass_Stage = Mass_Stage_engine' + Prop_Stage;

%% Total mass
Mass_Total = sum(Mass_Stage) + Mass_Payload;