obj-m := rotary_encoder.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	mkdir -p /lib/modules/$(shell uname -r)/extra
	cp -PR rotary_encoder.ko /lib/modules/$(shell uname -r)/extra/rotary_encoder.ko
	cp 90-devinput-rotary.rules /etc/udev/rules.d/
	depmod -a
	modprobe rotary_encoder
