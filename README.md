Docker base image for plone 4.3
-------------------------------

To be able to create our plone buildout fast and often, we base our other images on this one.

Plone buildout is based on plone test buildout version 4.3 (https://raw.github.com/collective/buildout.plonetest/master/plone-4.3.x.cfg).

Quick start
===========

Start the instance:

<pre>
docker run -p 8080:8080 jfroche/plone:4.3
</pre>

Access the instance on http://localhost:8080 using login admin / password admin.

To start the instance using volume

<pre>
mkdir filestorage
mkdir blobstorage
docker run -p 8080:8080 -v $PWD/filestorage:/code/var/filestorage -v $PWD/blobstorage:/code/var/blobstorage jfroche/plone:4.3
</pre>

How to reuse this image
========================

You can reuse this image like this in your Dockerfile in your own buildout directory.

We use the `ONBUILD` instruction (https://docs.docker.com/reference/builder/#onbuild) to avoid duplication and push reproducability. Here are the instructions that will be executed uppon build if you depend (FROM) on this image:

<pre>
ADD . /code/
USER root
RUN chown -R plone .
USER plone
RUN bin/buildout -N
</pre>

You can reuse this image like this in your Dockerfile in your own buildout directory.

<pre>
FROM jfroche/plone:4.3-onbuild
</pre>

Buildout is installed in /code

This will push your code in the container (with correct permissions) and start a buildout
based on the buildout created in our image (cf https://github.com/jfroche/docker-plone/blob/4.3/buildout.cfg) and you will avoid downloading all plone packages.

To be more explicit in your Dockerfile check the 4.3 branch (https://github.com/jfroche/docker-plone/tree/4.3) or image (FROM jfroche/plone:4.3)
which use ONBUILD instructions (https://docs.docker.com/reference/builder/#onbuild).

This image is not meant for production. We are building other images based on Relstorage for that.

We speed up local build of this image using: https://github.com/silarsis/docker-proxy
You might want to look at it for local build of your image (or use your own pypi mirror).
