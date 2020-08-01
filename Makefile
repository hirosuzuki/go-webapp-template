PORT=8000
DOCKER_IMAGE_NAME=go-webapp

server: app.go
	go build -o server

run:
	PORT=${PORT} ./server

docker-build:
	sudo docker build . -t ${DOCKER_IMAGE_NAME}

docker-run:
	sudo docker run -it --rm -p ${PORT}:${PORT} -e PORT=${PORT} ${DOCKER_IMAGE_NAME}
