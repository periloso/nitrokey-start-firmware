#!/usr/bin/expect

set timeout 20

spawn /home/periloso/gnuk/tool/gnuk_put_binary_libusb.py -p -u -s /home/periloso/gnuk/GNUK_SERIAL_NUMBER

expect "Admin password:"

send "12345678\r";

interact

##!/bin/bash
#
#killall gpg-agent
#
#/usr/bin/expect <<EOF
#EOF
