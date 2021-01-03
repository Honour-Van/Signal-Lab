function [spectrum] = spec_gram(signal)
N = length(signal);
spectrum = abs(fft(signal));
f = (0:N-1)*2/N;
plot(f, 20*log10(spectrum));
xlabel('Nomalized Frequency(\times \pi rad/sample)')
ylabel('Magnitude (dB)')
title('Spectrum (dB)')
xlim([0, 1]);
ylim([-20, 50])
grid;
end