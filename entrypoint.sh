#!/bin/sh -e

# Generate host keys if required
ssh-keygen -A

if [[ -z "${SSH_KEY}" ]]; then
  echo "SSH_KEY environment variable missing"
  exit 1
fi

echo "${SSH_KEY}" > /home/tunnel/.ssh/authorized_keys

# Start SSH daemon
exec /usr/sbin/sshd -D -e
