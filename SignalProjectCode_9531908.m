clc
clear
warning off
project

function project(~,~)
figure('position', [10 100 800 500]);
[filename, path] = uigetfile();
sound = fullfile(path, filename);
[data, fs] = audioread(sound);
f = fft(data);
n = length(data);
Power_Spectrum = 2 * (1 / (n * fs)) * abs(f(1:n / 2 + 1)) .^ 2;
frequency = linspace(0, 1000 , n / 32);
Peak = (fs / n) * find(Power_Spectrum == max(Power_Spectrum));
plot(frequency, Power_Spectrum(1:n / 32));
if (80 <= Peak && Peak <= 164)
    disp("Result: This Is A Man's Voice.");
elseif (170 <= Peak && Peak <= 254)
    disp("Result: This Is A Woman's Voice.");
else
    disp("Result: Couldn't Recognize.");
end
disp('--------------------------');
disp(['Peak Value Is ', num2str(Peak), '.']);
end
