clear;

x_i = csvread("data.csv");
y = zeros(1,length(x_i));

for i = 1 : (length(y)-1)
    y(i) = (x_i(i) + x_i(i+1)) / 2;
end
y(end) = y(1);

Y = fft(y);
mag = abs(fftshift(Y));
freq = linspace(-pi, pi, length(x_i));

plot(freq,mag)
xlabel('frequency index, f (Hz)');
ylabel('Y(f)');
title('Power Spectrum');