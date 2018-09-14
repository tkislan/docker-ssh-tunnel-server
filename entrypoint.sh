#!/bin/sh -e

# Generate host keys if required
ssh-keygen -A

# Start SSH daemon
exec /usr/sbin/sshd -D -e
