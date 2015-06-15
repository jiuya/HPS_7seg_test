#
TARGET = HPS_LED_HEX

#
CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -static -g -Wall  -I${SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/include
LDFLAGS =  -g -Wall  
CC = $(CROSS_COMPILE)gcc
ARCH= arm
#LDFLAGS =  -g -Wall  -Iteraisc_pcie_qsys.so -ldl
#-ldl must be placed after the file calling lpxxxx funciton


build: $(TARGET)
#-lmpeg2 --> link libmpeg2.a (lib___.a)
$(TARGET): main.o seg7.o led.o
	$(CC) $(LDFLAGS)   $^ -o $@  -lpthread -lrt
#	$(CC) $(LDFLAGS)  $^ -o $@  -ldl -lmpeg2  -lmpeg2convert -lpthread
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~ 
