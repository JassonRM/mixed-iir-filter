function signal_out = filter_test(signal_in)
 pkg load signal
 fc = 200; 
 fs = 40000;
 
 [b1,a1] = butter(1,25/(fs/2), "low") 
 [b2,a2] = butter(1,1900/(fs/2), "high")
 
 filtered1 = filter(b1, a1, signal_in);
 filtered2 = filter(b2, a2, signal_in);

 myfilter1 = [];
 w1 = 0;
 x = signal_in;
 for n = 1:size(signal_in, 1)
   a1w = - a1(2) * w1;
   w2 = x(n) + a1w;
   b0w = b1(1) * w2;
   b1w = b1(2) * w1;
   y = b0w + b1w; 
   w1 = w2;
   myfilter1 = [myfilter1; y];
 endfor
 
 myfilter2 = [];
 w1 = 0;
 x = signal_in;
 for n = 1:size(signal_in, 1)
   a1w = - a2(2) * w1;
   w2 = x(n) + a1w;
   b0w = b2(1) * w2;
   b1w = b2(2) * w1;
   y = b0w + b1w; 
   w1 = w2;
   myfilter2 = [myfilter2; y];
 endfor
 
 clf
 subplot ( 3, 2, 1)
 plot(signal_in(:),";Original;")
 subplot ( 3, 2, 3)
 plot(filtered1(:),";Octave low filter;")
 subplot ( 3, 2, 4)
 plot(myfilter1(:),";My low Filter;")
  subplot ( 3, 2, 5)
 plot(filtered2(:),";Octave high filter;")
 subplot ( 3, 2, 6)
 plot(myfilter2(:),";My high Filter;")
 
endfunction