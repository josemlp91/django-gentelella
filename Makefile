.PHONY: help

.DEFAULT_GOAL := help


help: ## This help.
	@echo
	@echo "\e[1;35m Port mapping used: $<\e[0m"
	@echo "\e[1;33m - Backend: localhost:8000 $<\e[0m"
	@echo
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo

build: ## Build developer containers.
	docker-compose build

up: ## Run developer containers.
	docker-compose up

silenceup: ## Run developer containers without print messages.
	docker-compose up -d

down: ## Force stop and delete all containers.
	docker-compose down

djangologs: ## Show and follow the django console messages
	docker-compose logs -f  web