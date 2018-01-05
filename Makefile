.PHONY: build help tag push

help:
	@cat Makefile

docker:
	docker build -t synapse .

tag:
	docker tag synapse:latest ptman/synapse:latest

push:
	docker push ptman/synapse:latest
