docker run --name ocserv --privileged \
    -p "4443:4443" \
    -p "4443:4443/udp" \
    -v "/root/openconnect/ocserv:/etc/ocserv" \
    -d tommylau/ocserv


docker run --name ocserv --privileged \
    -p "443:443" \
    -v "/root/openconnect/ocserv2:/etc/ocserv" \
    -d tommylau/ocserv
