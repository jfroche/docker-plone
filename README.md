Docker base image for plone 4.3 with Relstorage and PostgreSQL
--------------------------------------------------------------

Plone buildout is based on plone test buildout version 4.3 (https://raw.github.com/collective/buildout.plonetest/master/plone-4.3.x.cfg).

Storage is done using Relstorage (https://pypi.python.org/pypi/RelStorage) in a postgresql database.

We use fig (http://www.fig.sh/) to define the links between containers.

Quick start
===========

Start the instance:

<pre>
make build
make build-db
fig up
</pre>

Access the instance on http://localhost:8080 using login admin / password admin.

To look inside the postgresql run (after fig up):

<pre>
make debug
</pre>

To backup postgresql database locally:

<pre>
make backup
</pre>

This image is not meant for production. We are building other images based on Relstorage for that.

We speed up local build of this image using: https://github.com/silarsis/docker-proxy
You might want to look at it for local build of your image (or use your own pypi mirror).
