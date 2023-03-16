function [Delta_V, Delta_V_tot] = Propulsion(Engine_Data,Mass_Stage_Empty,Mass_Stage_Fuel,Mass_Total,x0,n_Stage)


% constants
g = 9.81;



% I moved the section of calculating the propellent mass to the mass func


%% Delta V %%

for n = 1:n_Stage
    Delta_V(:,n) = (Engine_Data.ISP(x0(:,n)).*g).*log(Mass_Total(:,1)./(Mass_Total(:,1) - Mass_Stage_Fuel(:,n)));
    Mass_Total = Mass_Total - Mass_Stage_Empty(:,n)- Mass_Stage_Fuel(:,n);
end

Delta_V_tot = sum(Delta_V,2);
