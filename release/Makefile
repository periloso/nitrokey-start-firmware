FIRMWARE_DIR=$(shell readlink -f last-build)
FLASH_FILE=$(FIRMWARE_DIR)/gnuk.hex
TOOLS=../tool
PASS=12345678
V=0
all: update

.PHONY: update
update:
	cd $(TOOLS) && ./upgrade_by_passwd.py -p ${PASS} --regnual $(FIRMWARE_DIR)/regnual.bin --gnuk ${FIRMWARE_DIR}/gnuk.bin -y -v ${V}
	@echo "Note: power cycle might be needed due to setting RDP flag on MCU, which stalls it"

.PHONY: flash
flash: $(FLASH_FILE)
	STM32_Programmer_CLI -c port=SWD -halt -e all --readunprotect
	STM32_Programmer_CLI -c port=SWD -halt -d $< -rst
	@echo "Written: $<"

.PHONY: reset
reset:
	STM32_Programmer_CLI -c port=SWD -halt -rst

#GNUK_CONFIG_EXTRA=--enable-hid-card-change
GNUK_CONFIG=--target=NITROKEY_START --vidpid=20a0:4211 --enable-factory-reset --enable-certdo $(GNUK_CONFIG_EXTRA)
.PHONY: build
build:
	sudo touch last-build
	cd ../docker/ && sudo env GNUK_CONFIG="${GNUK_CONFIG}"  make
	@echo "Built with '${GNUK_CONFIG}'"

.PHONY: build-hid
build-hid: GNUK_CONFIG_EXTRA=--enable-hid-card-change
build-hid: build

.PHONY: status
status:
	cd ../tool/ && python3 usb_strings.py
