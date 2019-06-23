FROM alpine:3.6
LABEL maintainer="Tomas Kislan - https://kislan.sk"

EXPOSE 22

RUN apk add --no-cache openssh && \
  sed -i s/"#GatewayPorts no"/"GatewayPorts yes"/g /etc/ssh/sshd_config && \
  echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config && \
  echo "ClientAliveCountMax 5" >> /etc/ssh/sshd_config && \
  adduser -D -s /bin/sh tunnel && \
  passwd -u tunnel >/dev/null 2>&1 && \
  chown -R tunnel:tunnel /home/tunnel && \
  mkdir -p /home/tunnel/.ssh && \
  touch /home/tunnel/.ssh/authorized_keys

COPY entrypoint.sh /

VOLUME ["/home/tunnel/.ssh"]

ENTRYPOINT ["/entrypoint.sh"]
