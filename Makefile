.PHONY: all build publish
IMAGE_NAME= strapdata/jmxsh
IMAGE_VERSION= 1.1

all:

clean:
	ant clean

compile:
	ant

build: compile
	docker build --rm -t $(IMAGE_NAME):$(IMAGE_VERSION) .

publish: build
	docker push "$(IMAGE_NAME):$(IMAGE_VERSION)"
