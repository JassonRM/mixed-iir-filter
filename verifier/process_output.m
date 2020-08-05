function filtered = process_output(filename, int_part)
  file = fopen(filename, 'r');
  a = textscan(file, "%s");
  a = a{1};
  
  filtered = [];
  int_part = int_part+1;
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
    filtered = [filtered; dec];
  endfor
  
 endfunction