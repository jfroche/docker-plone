build:
	docker build -t jfroche/plone:3.3 .
push:
	docker run --name plone33 jfroche/plone:3.3 echo "foo"
	docker export plone33 > plone33.tar
	cat plone33.tar | docker import - jfroche/plone:3.3
	docker push jfroche/plone:3.3
run:
	docker run jfroche/plone:3.3 /code/bin/instance fg
