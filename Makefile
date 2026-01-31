.PHONY: build build-local help

REGISTRY ?= ghcr.io
OWNER ?= $(shell git config --get user.name | tr ' ' '-' | tr '[:upper:]' '[:lower:]' || echo trulede)
IMAGE_NAME ?= task
TASK_VERSION ?= main
PLATFORMS ?= linux/amd64,linux/arm64,linux/arm/v7,darwin

help:
	@echo "Available targets:"
	@echo "  make build              - Build Docker image locally"
	@echo "  make build-local        - Build Docker image for current platform only"
	@echo "  make clean              - Remove built images"

build:
	docker buildx build \
		--platform $(PLATFORMS) \
		--build-arg TASK_VERSION=$(TASK_VERSION) \
		--tag $(REGISTRY)/$(OWNER)/$(IMAGE_NAME):$(TASK_VERSION) \
		--tag $(REGISTRY)/$(OWNER)/$(IMAGE_NAME):latest \
		.

build-local:
	docker build \
		--build-arg TASK_VERSION=$(TASK_VERSION) \
		--tag $(REGISTRY)/$(OWNER)/$(IMAGE_NAME):$(TASK_VERSION) \
		--tag $(REGISTRY)/$(OWNER)/$(IMAGE_NAME):latest \
		.

clean:
	docker rmi $$(docker images | grep $(IMAGE_NAME) | awk '{print $$3}') 2>/dev/null || true

.DEFAULT_GOAL := help
