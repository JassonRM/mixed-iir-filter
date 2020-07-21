function signal_out = filter_test(signal_in)
 pkg load signal

 [b, a] = butter(1, 50 / 800);
 
 filtered = filter(b, a, signal_in);

 myfilter = [];
 w1 = 0;
 x = signal_in;
 for n = 1:size(signal_in, 1)
   w2 = x(n) - a(2) * w1;
   y = b(1) * w2 + b(2) * w1;
   w1 = w2;
   myfilter = [myfilter; y];
 endfor
 
 clf
 subplot ( 2, 1, 1)
 plot(filtered(:),";Octave filter;")
 subplot ( 2, 1, 2)
 plot(myfilter(:),";My Filter;")
 
endfunction