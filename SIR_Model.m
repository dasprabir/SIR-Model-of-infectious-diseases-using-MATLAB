% SIR-Model
% This model for the spread of disease is dependent on the state variables
% S and I, R

% Prabir Kumar Das ---- 20 september ,2021

%% Set Parameters

I0 = 1e-4;      % Initial Proportion of Infected people
a = 1.25;       % Infection Coefficient in wk^-1 , 0.25,0.75,1.1 ,1.0 , Check for different values
b = 0.5;        % Removal Coefficient  in wk^-1
tmax = 52;      % Number of weeks
Imax = 1.1;     %Maximum number of Infected for Graph
dt = 0.01;      %size of time steps in weeks

plotchoice = 4; % 1 = S , 2=I , 3=R , 4 = all

%% Initialize vectors

t = 0 : dt : tmax ; % Time vector
Nt = length(t);     % Number of time steps
I = zeros(1,Nt);    % Infection vector
S = zeros(1,Nt);    % Susceptable vector
R = zeros(1,Nt);    % Removed / Recoverd vector 
I(1) = I0;          % Set initial infection value


%% Model Equation

for it = 1 : Nt-1
    
    S(it) = 1 - I(it)- R(it) ;  % S+I+R = 1 
    dI = a*I(it)*S(it) - b*I(it) ;
    I(it+1) = I(it) + dI*dt ;
    dR = b*I(it);
    R(it+1) = R(it) + dR*dt;
    
    
end
    S(Nt) = 1 -I(Nt)- R(Nt);
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
        plot(t,R,'-m','LineWidth',2)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel('Time (weeks)')
        ylabel('Proportion Recovered')
        title('Proportion of Recovered vs Time')
        
    case 4
        plot(t,I,'-r',...
            t,S,'-b',...
            t,R,'-m','LineWidth',2)
        axis([0 tmax 0 Imax])
        grid on
        grid minor
        xlabel('Time (weeks)')
        ylabel('Proportions of S and I,R')
        title('Proportion of S and I and R vs Time')
        
end

