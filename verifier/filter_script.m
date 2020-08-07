[signal1, signal2] = read_mif("/home/marco/Documents/Projects/mixed-iir-filter/multisim/Acondicionamiento.mif");
[low_out1, low_out2, high_out1, high_out2, filtered1, filtered2] = software_filters(signal1);

[modelsim1] = process_output("/home/marco/Documents/Projects/mixed-iir-filter/verifier/low_pass.txt", 15);
[modelsim2] = process_output("/home/marco/Documents/Projects/mixed-iir-filter/verifier/high_pass.txt", 15);

##clf
subplot ( 3, 3, 1)
subplot ( 2, 1, 1)
plot(signal2(:))
title("Original")

subplot ( 2, 1, 2)
plot(signal2(1:5000))
title("Original")


##subplot ( 3, 3, 4)
##plot(filtered1(:))
##title("Octave low filter")
##

##subplot ( 3, 3, 5)
##plot(low_out2(:))
##title("My Octave low filter")
##

##subplot ( 3, 3, 6)
##plot(modelsim1(:))
##title("My hardware low Filter")
##

##subplot ( 3, 3, 7)
####subplot ( 2, 1, 1)
##plot(filtered2(:))
##title("Octave high filter")
##

####subplot ( 2, 1, 2)
####plot(filtered2(1:500))
####title("Octave high filter")
##

##subplot ( 3, 3, 8)
##plot(high_out2(:))
##title("My Octave high filter")
##

##subplot ( 3, 3, 9)
####subplot ( 2, 1, 1)
##plot(modelsim2(:))
##title("My hardware high filter")
##

####subplot ( 2, 1, 2)
####plot(modelsim2(1:500))
####title("My hardware high filter")
