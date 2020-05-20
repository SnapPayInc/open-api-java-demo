IMAGE=594726941651.dkr.ecr.us-east-1.amazonaws.com/snappay/openapi-java-demo
COMMIT=$(shell git rev-parse --short HEAD)

docker:
	@echo "git version is " $(COMMIT)
	docker build --network host -t $(IMAGE):$(COMMIT) .

push:
	docker push $(IMAGE):$(COMMIT)
