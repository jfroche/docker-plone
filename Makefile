build:
	docker build -t jfroche/plone:5.0 .
clean:
	rm -f filestorage/*
	rm -fr blobstorage/*
