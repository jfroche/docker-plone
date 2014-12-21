build:
	docker build -t jfroche/plone:4.3-relstorage .
build-db:
	cd db && docker build -t jfroche/postgresql-plone .
update-bootstrap:
	curl https://bootstrap.pypa.io/bootstrap-buildout.py -o bootstrap.py
backup:
	fig run db tar zcfp /backup/backup.tar.gz /var/lib/postgresql
debug:
	fig run db psql -U plone -d plone_zodb -h 172.17.42.1
debug-sh:
	fig run db bash
