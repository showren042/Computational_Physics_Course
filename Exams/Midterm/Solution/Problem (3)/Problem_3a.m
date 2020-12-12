clear;

x_i = csvread("data.csv");

X = fft(x_i);
mag = abs(fftshift(X));
freq = linspace(-pi, pi, length(x_i));

plot(freq,mag)
xlabel('frequency index, f (Hz)');
ylabel('X(f)');
title('Power Spectrum');