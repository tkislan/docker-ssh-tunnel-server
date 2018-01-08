# Containerized SSH tunnel

To connect from local device
```
ssh -N -p <server_exposed_port> -R <port_inside_container>:localhost:<localhost_port> tunnel@<server_host>
```
