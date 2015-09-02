build:
	docker build -t jfroche/docker-plone:3.3 .
push:
	docker run --name docker-plone33 jfroche/docker-plone:3.3 echo "foo"
	docker export docker-plone33 > docker-plone33.tar
	cat docker-plone33.tar | docker import - jfroche/docker-plone:3.3
	docker push jfroche/docker-plone:3.3
run:
	docker run jfroche/docker-plone:3.3 /code/bin/instance fg
