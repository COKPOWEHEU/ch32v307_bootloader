progname := firmware
progdir := res
files := main
HSE_CLOCK := 8000000

srcdir := src
builddir := build
libdir := lib

CROSS_COMPILE=riscv64-unknown-elf-
CC=$(CROSS_COMPILE)gcc
AS=$(CROSS_COMPILE)gcc
LD=$(CROSS_COMPILE)gcc
OBJCOPY=$(CROSS_COMPILE)objcopy
OBJDUMP=$(CROSS_COMPILE)objdump
SIZE=$(CROSS_COMPILE)size

COMMON = -MD -MP -MT $(builddir)/$(*F).o -MF $(builddir)/dep/$(@F).mk
COMMON += -march=rv32imafc_zicsr_zifencei -mabi=ilp32 -mcmodel=medany -static -gdwarf-2 -fno-plt -fno-pic
COMMON += -DHXTAL_VALUE=$(HSE_CLOCK)
ASMFLAGS = $(COMMON)
CFLAGS = $(COMMON)
CFLAGS += -Wall -Os -g -Wno-main -Wstack-usage=400 -ffreestanding -Wno-unused -nostdlib -fno-builtin-printf
LDFLAGS := $(COMMON) -Wl,--build-id=none -nostdlib -T lib/ch32v307.ld

frmname = $(progdir)/$(progname)
objs = $(addprefix $(builddir)/,$(addsuffix .o,$(files)))

all: $(frmname).bin $(frmname).hex $(frmname).lss size

$(frmname).bin: $(frmname).elf
	$(OBJCOPY) -O binary $^ $@
$(frmname).hex: $(frmname).elf
	$(OBJCOPY) -Oihex $(frmname).elf $(frmname).hex
$(frmname).lss: $(frmname).elf
	$(OBJDUMP) -D -S $(frmname).elf > $(frmname).lss

$(frmname).elf: $(objs) lib/ch32v307.ld
	mkdir -p $(progdir)
	@ echo "..linking"
	$(LD) $(LDFLAGS) $(objs) -o $@ 

$(builddir)/%.o: $(srcdir)/%.c
	mkdir -p $(builddir)
	$(CC) -c $(CFLAGS) $< -o $@
$(builddir)/%.o: $(srcdir)/%.S
	mkdir -p $(builddir)
	$(CC) -c $(ASMFLAGS) $< -o $@
$(builddir)/%.o: $(libdir)/%.S
	mkdir -p $(builddir)
	$(CC) -c $(ASMFLAGS) $< -o $@
$(builddir)/n200_func.o: $(libdir)/Firmware/RISCV/drivers/n200_func.c
	mkdir -p $(builddir)
	$(CC) -c $(CFLAGS) $< -o $@

$(progdir)/ref.lss: reference/Boot_V307_.bin
	mkdir -p $(progdir)
	$(OBJDUMP) -b binary -m riscv:rv32 --stop-address=0x2100 -D -z $< > $@
$(progdir)/src.lss: $(frmname).bin
	mkdir -p $(progdir)
	$(OBJDUMP) -b binary -m riscv:rv32 --stop-address=0x2100 -D -z $< > $@
$(progdir)/ref.hexdump: reference/Boot_V307_.bin
	mkdir -p $(progdir)
	hexdump $< > $@
$(frmname).hexdump: $(frmname).bin
	mkdir -p $(progdir)
	hexdump $< > $@
	
clean:
	rm -rf $(progdir)
	rm -rf $(builddir)
size: $(frmname).elf
	$(SIZE) $(frmname).elf
	
test: $(frmname).hexdump $(frmname).lss $(progdir)/src.lss $(progdir)/ref.hexdump $(progdir)/ref.lss
	diff $(frmname).hexdump $(progdir)/ref.hexdump | head
	

-include $(shell mkdir -p $(builddir)/dep) $(wildcard $(builddir)/dep/*)

.PHONY: all clean
