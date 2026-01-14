FROM ubuntu:22.04

# Install coturn
RUN apt update && apt install -y coturn

# Copy the config file
COPY turnserver.conf /etc/turnserver.conf

# Expose TURN server ports
EXPOSE 3478/tcp
EXPOSE 3478/udp
EXPOSE 5349/tcp

# Run coturn using config file
CMD ["turnserver", "-c", "/etc/turnserver.conf", "--no-cli"]
