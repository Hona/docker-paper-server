# The JDK includes JRE and JVM
FROM openjdk:14.0.2-slim

# Expose the Minecraft server ports
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Install wget
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get -qy install wget

# Bring in the script
COPY ["paper.sh", "."]

# Script fetches the paper version specified, fetches plugins and starts paper
ENTRYPOINT ["bash", "paper.sh"]