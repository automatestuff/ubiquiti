#!/bin/sh

interfaces=$(ip link list | grep -i switch | sed 's/^[^:]*://g; s/:.*//; s/@switch0.*//')
sfp=$(ip link list | grep -i eth10 | sed 's/^[^:]*://g; s/:.*//; s/@eth10.*//')

for interface in $interfaces
    do
        ip link set dev $interface mtu 9000
done

for sfp in $sfp
    do
        ip link set dev $sfp mtu 9000
done