docker run --name ocserv --privileged \
    -p "4443:4443" \
    -p "4443:4443/udp" \
    -v "/root/openconnect/ocserv:/etc/ocserv" \
    -d tommylau/ocserv


docker run --name ocserv --privileged \
    -p "443:443" \
    -v "/root/openconnect/ocserv2:/etc/ocserv" \
    -d tommylau/ocserv



services:
  nginx:
    image: nginx
    container_name: nginx
    volumes:
      - ./nginx/conf.d:/etc/nginx/conf.d
      - ./nginx/www:/var/www
    ports:
      - "80:80"
      - "443:443"
    environment:
      - NGINX_HOST=<vpn_domain_name>
      - NGINX_PORT=80
      - NGINX_PORT_SSL=443