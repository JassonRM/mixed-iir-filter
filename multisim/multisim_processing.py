def process(osc_path, output_path, sampling_rate, runtime, int_bits, dec_bits):
    with open(osc_path) as reader:
        with open(output_path, "w+") as writer:

            time = 1 / sampling_rate
            previous_time = 0

            while reader.readline() != "-------------------------------\n":
                continue

            line = reader.readline()
            addr = 0

            writer.write("DEPTH = 20000; \nWIDTH = 16; \nADDRESS_RADIX = DEC; \nDATA_RADIX = HEX; \nCONTENT \nBEGIN;\n")

            while line != '':  # The EOF char is an empty string
                data = line.split()
                if float(data[0]) >= runtime:
                    writer.write("END;")
                    break

                if float(data[0]) >= previous_time:
                    num = float(data[1])
                    hex_str = dec_to_hex(num, int_bits, dec_bits)

                    writer.write(str(addr) + " : " + hex_str + ";\n")
                    addr += 1
                    previous_time += time

                line = reader.readline()


def dec_to_hex(num, int_bits, dec_bits):
    result = '0'
    if num < 0:
        result = '1'
        num = abs(num)
    int_part = bin(int(num)).replace('0b', '')
    zeros = int_bits - len(int_part)
    result += zeros * '0' + int_part
    dec_part = num - int(num)
    for i in range(dec_bits):
        dec_part = dec_part * 2
        temp = int(dec_part)
        result += str(temp)
        dec_part -= temp
    return hex(int(result, 2)).replace('0x', '')


process("Acondicionamiento.scp", "Acondicionamiento.mif", 40000, 0.5, 7, 8)
