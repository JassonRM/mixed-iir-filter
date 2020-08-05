 function [signal1, signal2] = read_mif(filepath)
  
  file = fopen(filepath, 'r');
  a = textscan(file, "%s : %s","HeaderLines", 6);
  a = a{2};
  
  signal1 = [];
  signal2 = [];
  int_part = 7;
  for i = 1:size(a)(1)
    number = a{i};
    dec = 0;
    for int_index = 1:int_part-1
      bit = number(int_part - int_index + 1);
      if bit != '0'
        dec = dec + 2**(int_index-1);
      endif
    endfor
    
    for dec_index = 1:int_part-1
      bit = number(int_part + dec_index);
      if bit != '0'
        dec = dec + 2**(-dec_index);
      endif
    endfor
    signal2 = [signal2; dec];
    dec = dec -2.5;
    signal1 = [signal1; dec];
  endfor
  
endfunction
