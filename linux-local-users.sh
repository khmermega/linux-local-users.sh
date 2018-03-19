#!/bin/bash

for i in $(awk -F: '($3>=1000)&&($1!="nobody"){print $1}' /etc/passwd | \
cut -d: -f1); do echo "Username => " $i "=> "; grep $i /etc/group | cut -d: -f1 ; \
echo "Expired Date =>"; chage -l $i | fgrep "Password expires" |cut -d: -f2 |   column -t; \
echo ; done; 
