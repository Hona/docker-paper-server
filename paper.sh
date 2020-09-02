#!/bin/bash

# Verify server directory is mounted by Docker
SERVER_DIR=server

if [[ ! -e "${SERVER_DIR}" ]]; then
    echo "'/server' directory doesn't exist, did you set the volume to mount with Docker?" 
    exit 1
fi

cd ${SERVER_DIR}

# Get the server jar file
SERVER_JAR=paper-${MC_VERSION}-${PAPER_VERSION}.jar

# If the specific build doesn't exist, fetch it. This will never change.
# Always fetch the latest version if specified
if [[ ! -f "${SERVER_JAR}" || "${PAPER_VERSION,,}" == "latest" ]]; then
    wget https://papermc.io/api/v1/paper/${MC_VERSION}/${PAPER_VERSION}/download -O ${SERVER_JAR}

    # Set EULA from env vars
    if [[ ! -f "eula.txt" ]]; then
        echo "eula=${EULA}" >> eula.txt
    fi
fi

# Fetch the specified plugins on first start
if [[ ! -e "plugins" ]]; then
    mkdir plugins
    cd plugins
    wget -i /plugin-urls.txt
    cd ..
fi

# Everything is setup, ready to start
java -server ${JAR_ARGS} -jar ${SERVER_JAR} nogui