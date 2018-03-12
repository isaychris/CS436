t = 0:9999;	% Samplings frequency 10 kHz 
x = 5*cos(2*pi*100*t/10000);	% Signal, 100 Hz cos 
subplot(2,1,1);	% allows 2 plots in a display
plot(t(1:500),x(1:500));	% time domain plot 
title('Original Signal');
xlabel('time (milliseconds)');

Y = 2*abs(fft(x))/length(t);	% perform Fourier analysis
f = 0:9999;	% frequency range or x-axis for 2nd plot 
subplot(2,1,2);
plot(f(1:200),Y(1:200));	% frequency domain plot 
title('Frequency Domain');
xlabel('Frequency');