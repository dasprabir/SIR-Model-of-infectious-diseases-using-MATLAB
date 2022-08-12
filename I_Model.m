%I-Model

%% Set Parameters

I0 = 10; % Initial Number of Infected people
a = 1.5;  % Coefficient in wk^-1 , 0.25,0.75,
tmax = 10;  % Number of weeks
Imax = 5e4;  %Maximum number of Infected for Graph
dt = 0.01;   %size of time steps in weeks

%% Initialize vectors

t = 0 : dt : tmax; % Time vector
Nt = length(t); %Number of time steps
I = zeros(1,Nt);  %Infection vector
I(1) = I0;        % Set initial infection value


%% Model Equation

for it = 1 : Nt-1
    
    dI = a*I(it) ;
    I(it+1) = I(it) + dI*dt;
    
    
end

%% Plots

plot(t,I,'-b','LineWidth',2)
axis([0 tmax 0 Imax])
grid on
grid minor
xlabel('Time (weeks)')
ylabel('Number Infected')
title('Number of Infected vs Time')