Engine_Data = readtable('Data.xlsx','Sheet','Engine Data');

%% Initial Generations %%

n_Stage = 2;


x0 = randi([1,27],20,n_Stage);

%% Functions %%

% mass model
[Mass_Stage_Empty,Mass_Stage_Fuel , Mass_Total] = Mass(Engine_Data,x0,n_Stage);

% propulsion model
[Delta_V, Delta_V_tot] = Propulsion(Engine_Data,Mass_Stage_Empty,...
                                Mass_Stage_Fuel,Mass_Total,x0,n_Stage);
% finance model
[Cost_Stage, Cost_Total] = Finance(Mass_Stage_Empty,n_Stage);


max(Delta_V_tot)