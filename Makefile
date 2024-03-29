dev-startup:
	docker run -d --name apache-apisix-standalone \
  	-p 9080:9080 \
	-v $(shell pwd)/conf/config.yaml:/usr/local/apisix/conf/config.yaml \
	-v $(shell pwd)/conf/apisix.yaml:/usr/local/apisix/conf/apisix.yaml \
	-v $(shell pwd)/logs:/usr/local/apisix/logs \
	-v $(shell pwd)/src:/usr/local/apisix/custom-plugins \
  	apache/apisix

dev-start:
	docker start apache-apisix-standalone

dev-stop:
	docker stop apache-apisix-standalone

dev-rm:
	docker rm apache-apisix-standalone

dev-reload:
	docker exec -it apache-apisix-standalone apisix reload

dev-shell:
	docker exec -it apache-apisix-standalone /bin/bash