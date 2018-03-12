clear;	% init: clears all vars from memory

bits=[0 1 0 0 1 1 0 0 0 1 1];   % input string
numOfBits = length(bits);       % store no of bits in string

sampTime = 0.001;				% sample time
endTime = numOfBits-sampTime;	% required end time for given bit string   
t = 0:sampTime:endTime; 		% x-axis (0 to endTime with sampTime step)

j = 1;	% index of the signal vector, s
bit = 1;	% current bit
for i = 0:sampTime:endTime 
	if (floor(i)+1 ~= bit)
	% checks whether in the same bit 
		bit = bit + 1;
	end;
	
	if (bits(bit) == 0)
	% sets voltage for bit 0 (+ve) 
		s(j) = 1;
	else
	% sets voltage for bit 1 (-ve)
		s(j) = -1;
	end;
	j = j + 1; 
end;

% randn generates an array of random number between (0,1) 
s = s + 2*randn(size(i));	

% plots the signal 
plot(t,s);
axis([0 numOfBits -3 3]); 
xlabel('Time (s)'); 
ylabel('Voltage');