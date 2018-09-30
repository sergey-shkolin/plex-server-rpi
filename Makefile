VERSION=$(shell cat VERSION.txt) 

# Build the container
build:
	docker build --no-cache -t sergeyshkolin/plex-server-rpi:$(VERSION) .

tag:
	docker tag sergeyshkolin/plex-server-rpi:$(VERSION)	sergeyshkolin/plex-server-rpi:latest

push: 
	push-version tag push-latest

push-latest:  ## push the `latest` taged container
	docker push sergeyshkolin/plex-server-rpi:latest

push-version:  ## push the `{version}` taged container
	docker push sergeyshkolin/plex-server-rpi:$(VERSION)

.PHONY: build push
