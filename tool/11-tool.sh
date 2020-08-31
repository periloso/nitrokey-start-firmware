#!/usr/bin/expect

set timeout 20

spawn pkcs11-tool --login --test

expect "Please enter User PIN:"

send "123456\r";

interact

##!/bin/bash
#
#killall gpg-agent
#
#/usr/bin/expect <<EOF
#EOF
