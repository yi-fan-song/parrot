ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

IMAGE_NAME=parrot
BUILD_DIR=build_dir

all: build

.PHONY: all build build_docker

build: $(BUILD_DIR)/parrot $(BUILD_DIR)/parrot.exe

$(BUILD_DIR)/parrot: $(BUILD_DIR) build_docker
	docker run -v $(ROOT_DIR)/$(BUILD_DIR):/out/ $(IMAGE_NAME):latest

$(BUILD_DIR)/parrot.exe: $(BUILD_DIR) build_docker
	docker run -v $(ROOT_DIR)/$(BUILD_DIR):/out/ -e GOOS=windows parrot:latest /out/parrot.exe .

build_docker:
	docker build -t $(IMAGE_NAME):latest $(ROOT_DIR)

$(BUILD_DIR):
	mkdir $(ROOT_DIR)/$(BUILD_DIR)
