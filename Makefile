PORT=8000
DOCKER_IMAGE_NAME=go-webapp

app: app.go
	go build -o app

run:
	PORT=${PORT} ./app

docker-build:
	sudo docker build . -t ${DOCKER_IMAGE_NAME}

docker-run:
	sudo docker run -it --rm -p ${PORT}:${PORT} -e PORT=${PORT} ${DOCKER_IMAGE_NAME}
