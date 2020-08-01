PORT=8000
CLOUDRUN_APP_NAME=template-webapp
DOCKER_IMAGE_NAME=go-webapp

server: app.go
	go build -o server

run:
	PORT=${PORT} ./server

docker-build:
	sudo docker build . -t ${DOCKER_IMAGE_NAME}

docker-run:
	sudo docker run -it --rm -p ${PORT}:${PORT} -e PORT=${PORT} ${DOCKER_IMAGE_NAME}

cloudrun-build:
	gcloud builds submit --tag gcr.io/`gcloud config get-value project`/${CLOUDRUN_APP_NAME}

cloudrun-deploy:
	gcloud run deploy --image gcr.io/`gcloud config get-value project`/${CLOUDRUN_APP_NAME} --platform managed

