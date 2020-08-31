#!/bin/bash

killall gpg-agent
sleep 1

openocd -f openocd.cfg \
  -c "init" \
  -c "reset halt" \
  -c "stm32f1x mass_erase 0" \
  -c "flash write_bank 0 $(pwd)/../src/build/gnuk.bin 0" \
  -c "reset halt" \
  -c "reset run" \
  -c "exit"

sleep 3
nitropy start list
