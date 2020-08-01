app: app.go
	go build -o app

run:
	PORT=8080 ./app