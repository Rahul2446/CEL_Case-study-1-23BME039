clc;
clear;


R1 = 0.1;     
R2 = 0.48;    
Tamb = 35;    
Qgen = 50;   


G1 = 1/R1;     
G2 = 1/R2;     


A = [ (G2+G1+G1)   -G1            0            0;
      -G1        (G2+G1+G1)     -G1            0;
       0           -G1        (G2+G1+G1)     -G1;
       0            0           -G1        (G2+G1+G1)];

B = [ Tamb*(G2+G1);
      Tamb*(G2);
      Tamb*(G2);
      Tamb*(G2+G1) + Qgen ];


T = A\B;


fprintf('Temperature at Ground Floor (T0) = %.2f °C\n', T(1));
fprintf('Temperature at 1st Floor (T1)    = %.2f °C\n', T(2));
fprintf('Temperature at 2nd Floor (T2)    = %.2f °C\n', T(3));
fprintf('Temperature at 3rd Floor (T3)    = %.2f °C\n', T(4));
floors = 0:3;                 
figure;
plot(floors, T, '-o', 'LineWidth', 1.5, 'MarkerSize', 8);
grid on;
xlabel('Floor (0 = Ground)');
ylabel('Temperature (°C)');
title('Temperature vs Floor');
xlim([0 3]);
xticks(floors);
for k = 1:numel(T)
    text(floors(k), T(k), sprintf('  %.2f°C', T(k)), 'VerticalAlignment','bottom');
end