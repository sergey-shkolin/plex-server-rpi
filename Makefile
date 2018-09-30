VERSION=$(shell cat VERSION.txt) 

.PHONY: build push

build:
	docker build --no-cache -t sergeyshkolin/plex-server-rpi:$(VERSION) .

push-latest:
	docker push sergeyshkolin/plex-server-rpi:latest

tag:
	docker tag sergeyshkolin/plex-server-rpi:$(VERSION)	sergeyshkolin/plex-server-rpi:latest

push-version:
	docker push sergeyshkolin/plex-server-rpi:$(VERSION)

push: push-version tag push-latest
