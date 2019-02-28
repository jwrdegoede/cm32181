obj-m += cm32181.o

KBASE  ?= /lib/modules/`uname -r`
KBUILD ?= $(KBASE)/build
MDEST  ?= $(KBASE)/kernel/drivers/iio/light

all:
	${MAKE} -C $(KBUILD) M=$(PWD) modules
	xz -f cm32181.ko

clean:
	${MAKE} -C $(KBUILD) M=$(PWD) clean
	rm cm32181.ko.xz

install:
	install -D -m 644 cm32181.ko.xz $(MDEST)
	depmod -a
