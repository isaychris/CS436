% Performs Manchester encoding on a bit string. It assumes each signal element
% is 0.5 sec.
clear;	% init: clears all vars from memory 
bits = [0 1 0 0 1 1 0 0 0 1 1]; % input string
numOfBits = length(bits);	% store no of bits in string

sampTime = 0.001;	% sample time 
endTime = numOfBits - sampTime;	% end time 
t=0:sampTime:endTime;	% time vector 
cycle = floor(length(t)/(numOfBits-1)); % samples per bit 
j = 1;
halfElem = j + cycle/2;	% samples per half bit
bit = 1;	% tracks the current bit

for i=0:sampTime:endTime
	if (floor(i)+1 ~= bit)
	% check whether in the same bit
	% if new bit, recalc offset to next bit centre 
		halfElem = j + cycle/2;
		bit = bit + 1; 
	end;
	if (bits(bit)== 0)
	% if bit 0, do high to low transition at bit centre 
		if (j < halfElem)
			s(j) = 1;
		else
			s(j) = -1;
		end;
	else
	% if bit 1, do low to high transition at bit centre
		if (j < halfElem)
			s(j) = -1;
		else
			s(j) = 1;
		end;
	end;
	j = j + 1; 
end;

% plots the signal 
plot(t,s);
axis([0 numOfBits -3 3]);
xlabel('Time (s)'); ylabel('Voltage');