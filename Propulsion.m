function [Delta_V, Delta_V_tot] = Propulsion(Engine_Data,Mass_Stage,Mass_Fuel, Mass_Total,x0,n_Stage)


%% Delta V %%

Delta_V = zeros(n_Stage,1);

for n = 1:n_Stage
    % calculating the deltaV of this stage
    Delta_V(n) = Engine_Data.ISP(x0(n)).*log(Mass_Total./(Mass_Total - Mass_Fuel(:,n)));
    % removing the stage
    Mass_Total = Mass_Total - Mass_Stage(n);
end

Delta_V_tot = sum(Delta_V);
