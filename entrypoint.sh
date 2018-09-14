#!/bin/sh -e

# Generate host keys if required
ssh-keygen -A

echo "${SSH_KEY}" > /home/tunnel/.ssh/authorized_keys

# Start SSH daemon
exec /usr/sbin/sshd -D -e
