#!/bin/bash

#Set your subnet here
IPRANGE="10.0.2"


x=0
for y in {16..35};do
  #add fakeip on the vm to do testing
  ifconfig eth0:${x} ${IPRANGE}.${y} netmask 255.255.255.0 up
  ((x+=1))
done

route add -net 192.168.10.0 netmask 255.255.255.0 gw 10.0.2.2

ifconfig -a

