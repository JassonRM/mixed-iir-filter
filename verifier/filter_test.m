function signal_out = filter_test(signal_in)
 pkg load signal
 fc = 200; 
 fs = 40000;  
 [b,a] = butter(1,fc/(fs/2), "high")
 
 filtered = filter(b, a, signal_in);

 myfilter = [];
 w1 = 0;
 x = signal_in;
 for n = 1:size(signal_in, 1)
   a1w = - a(2) * w1;
   w2 = x(n) + a1w;
   b0w = b(1) * w2;
   b1w = b(2) * w1;
   y = b0w + b1w; 
   w1 = w2;
   myfilter = [myfilter; y];
 endfor
 
 clf
 subplot ( 2, 1, 1)
 plot(filtered(:),";Octave filter;")
 subplot ( 2, 1, 2)
 plot(myfilter(:),";My Filter;")
 
endfunction