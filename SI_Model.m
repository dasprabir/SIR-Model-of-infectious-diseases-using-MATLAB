%I-Model
% This model for the spread of disease is dependent on the state variables S and I
% LOGISTIC GROWTH CURVE
% Prabir Kumar Das ---- 20 september ,2021

%% Set Parameters

I0 = 0.001; % Initial Proportion of Infected people
a = 1.25;  % Coefficient in wk^-1 , 0.25,0.75,1.1 ,1.0
tmax = 10;  % Number of weeks
Imax = 1.1;  %Maximum number of Infected for Graph
dt = 0.01;   %size of time steps in weeks

plotchoice = 3; % 1 = S , 2=I , 3 = all

%% Initialize vectors

t = 0 : dt : tmax ; % Time vector
Nt = length(t);    %Number of time steps
I = zeros(1,Nt);   %Infection vector
S = zeros(1,Nt);  
I(1) = I0;         % Set initial infection value


%% Model Equation

for it = 1 : Nt-1
    
    S(it) = 1 - I(it);
    dI = a*I(it)*S(it) ;
    I(it+1) = I(it) + dI*dt;
    
    
end

%% Plots
switch plotchoice          %  Ctrl + I for Indentation
    case 1
        plot(t,S,'-b','LineWidth',2)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel('Time (weeks)')
        ylabel('Proportion Susceptable')
        title('Proportion of Susceptable vs Time')
    case 2
        plot(t,I,'-r','LineWidth',2)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel('Time (weeks)')
        ylabel('Proportion Infected')
        title('Proportion of Infected vs Time')
        
    case 3
        plot(t,I,'-r',...
            t,S,'-b','LineWidth',2)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel('Time (weeks)')
        ylabel('Proportions of S and I')
        title('Proportion of S and I vs Time')
        
end

