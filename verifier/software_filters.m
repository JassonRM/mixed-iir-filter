function [low_out1, low_out2, high_out1, high_out2, filtered1, filtered2] = software_filters(signal_in)
 pkg load signal
 fc = 200; 
 fs = 40000;
 
 [b1,a1] = butter(1,100/(fs/2), "low");
 [b2,a2] = butter(1,1000/(fs/2), "high");
 
 filtered1 = filter(b1, a1, signal_in);
 filtered2 = filter(b2, a2, signal_in);

 low_out1 = [];
 low_out2 = [];
 w1 = 0;
 x = signal_in;
 for n = 1:size(signal_in, 1)
   a1w = - a1(2) * w1;
   w2 = x(n) + a1w;
   b0w = b1(1) * w2;
   b1w = b1(2) * w1;
   y = b0w + b1w;
   w1 = w2;
   low_out1 = [low_out1; y];
   low_out2 = [low_out2; y + 2.5];
 endfor
 
 high_out1 = [];
 high_out2 = [];
 w1 = 0;
 x = signal_in;
 for n = 1:size(signal_in, 1)
   a1w = - a2(2) * w1;
   w2 = x(n) + a1w;
   b0w = b2(1) * w2;
   b1w = b2(2) * w1;
   y = b0w + b1w;
   w1 = w2;
   high_out1 = [high_out1; y];
   high_out2 = [high_out2; y + 2.5];
 endfor
 

 
endfunction