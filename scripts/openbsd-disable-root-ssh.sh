#!/bin/ksh

echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
rcctl restart sshd