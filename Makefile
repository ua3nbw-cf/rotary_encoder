obj-m := rotary_encoder.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	sudo cp rotary_encoder.ko /lib/modules/$(shell uname -r)/extra
	sudo cp 90-devinput-rotary.rules /etc/udev/rules.d/
	sudo depmod -a
	sudo modprobe rotary_encoder