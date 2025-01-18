.DEFAULT_GOAL := help
NAME ?= 'default'

docker-build: ## Build the Docker container
	docker build -t $(NAME) -f ./Docker/Dockerfile .


docker-run: ## Run the Docker container
	docker run --rm -it \
	--name $(NAME) $(NAME)



docker-bash: ## Access container bash
	docker exec -it $(NAME) /bin/bash



# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
