FROM ubuntu:22.04

# Install coturn
RUN apt update && apt install -y coturn

# Expose TURN server ports
EXPOSE 3478/tcp
EXPOSE 3478/udp
EXPOSE 5349/tcp

# Run coturn using Render environment variables
CMD ["sh", "-c", "turnserver -n -a -u $USER -r $REALM --listening-port=$LISTEN_PORT --tls-port=$TLS_PORT --no-cli"]
