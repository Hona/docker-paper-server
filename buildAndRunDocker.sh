IMAGE_NAME=paper-server
CONTAINER_NAME=${IMAGE_NAME}-production

echo -e '-= Stopping Server Container =-\n'
docker container stop ${CONTAINER_NAME}

echo -e '-= Removing Server Container =-\n'
docker container rm ${CONTAINER_NAME}

echo -e '-= Building New Server Container =-\n'
docker build -t ${IMAGE_NAME} .

echo -e '-= Running the Server Container =-\n'
docker run \
-v $PWD/server:/server \
-v ${PWD}/plugin-urls.txt:/plugin-urls.txt \
-p 25565:25565 \
--restart always \
--name "${CONTAINER_NAME}" \
-d \
-it \
--env-file env-vars.list \
${IMAGE_NAME}