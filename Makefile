GCC?=gcc
DTC?=dtc
DTC_OPTIONS?=-@

OBJECTS:= $(patsubst %.dts,%.dtbo,$(wildcard firmware/*.dts firmware/early/*.dts samples/*.dts))

%.pre.dts: %.dts
	$(GCC) -E -nostdinc -I$(CURDIR)/include -x assembler-with-cpp -o $@ $^

%.dtbo: %.pre.dts
	$(DTC) $(DTC_OPTIONS) -I dts -O dtb -o $@ $^

all: $(OBJECTS)

clean:
	rm -f $(OBJECTS)
