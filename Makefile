all: start

.PHONY: service-gateway
service-gateway:
	@docker build -t service-gateway -f service-gateway/Dockerfile .

.PHONY: service-ticket
service-ticket:
	@docker build -t service-ticket -f service-ticket/Dockerfile .

.PHONY: start
start: service-gateway service-ticket
	@docker compose up -d --remove-orphans

.PHONY: stop
stop:
	@docker compose down
	docker rmi service-gateway service-ticket
