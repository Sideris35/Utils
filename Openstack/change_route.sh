#!/bin/bash
route add -net 10.67.188.0 netmask 255.255.252.0 gw 10.26.9.1 dev  enp4s0.748
route del -net 0.0.0.0 gw 10.26.9.1 dev enp4s0.748

