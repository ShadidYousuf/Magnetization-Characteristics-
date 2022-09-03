load mag_curve_1.dat;
mmf_data = mag_curve_1(:,1);
flux_data = mag_curve_1(:,2);

% Initialize values
VM = 240;                   % Maximum voltage (V)
NP = 1028;                   % Number of turns


% Calculate angular velocity for 50 Hz
freq = 50;                 
w = 2 * pi * freq;

% Calculate flux versus time
time = 0:1/3000:2/15;       % 0 to 1/30 sec
flux = -VM/(w*NP) * cos(w .* time);

% Calculate the mmf corresponding to a given flux
% using the 's interpolation function.
mmf = interp1(flux_data,mmf_data,flux);

% Calculate the magnetization current
im = mmf / NP;


% Plot the magnetization current.
figure(1)

subplot(3,1,1);
plot(time,flux);
title ('\bfFlux Waveshape');
xlabel ('\bfTime (s)');
ylabel ('\bf\it\phi(Wb)');
grid on;
%axis([0 0.04 -2 2]);

subplot(3,1,2);
plot(mmf,flux);
title ('\bfMagnetization Curve For CRGO Steel');
xlabel ('\bfMagnetomotive Force (A.turns)');
ylabel ('\bf\it\phi(Wb)');
grid on;
%axis([0 0.04 -2 2]);

subplot(3,1,3);
plot(time,im);
title ('\bfMagnetization current');
xlabel ('\bfTime (s)');
ylabel ('\bf\itI_{m} \rm(A)');
axis([0 0.04 -2 2]);
grid on;



