.PHONY: build clean help

help:
	@cat Makefile

docker:
	docker build -t synapse .
