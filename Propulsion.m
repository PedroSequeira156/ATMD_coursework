function [Delta_V, Delta_V_tot] = Propulsion(Engine_Data,Mass_Stage,Mass_Total,x0,n_Stage)

%% Inputs %%

FR_Max = 0.95;                              %max propellant fraction
k1 = [0.5917 0.4917 0.3917 0.2917];         %constant straight from paper
k2 = 0.29;                                  %constant straight from paper
g = 9.81;                                   %gravity constant on earth
%lb_2_Kg = 0.453592;                        %pounds mass to kg
Kg_2_lb =2.20462;                           %kg to pounds mass

%% Mass Fraction Per Stage %%

FR = FR_Max - k1(1:n_Stage).*((Mass_Stage.*Kg_2_lb).^(-k2));
Mass_Fuel = FR.*Mass_Stage;

%% Delta V %%

for n = 1:n_Stage
    Delta_V(:,n) = (Engine_Data.ISP(x0(:,n)).*g).*log(Mass_Total(:,1)./(Mass_Total(:,1) - Mass_Fuel(:,n)));
    Mass_Total = Mass_Total - Mass_Stage(:,n);
end

Delta_V_tot = sum(Delta_V,2);
