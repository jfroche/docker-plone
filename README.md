Docker base image for plone 4.3
-------------------------------

To be able to create our plone buildout fast and often, we base our other images on this one.

Plone buildout is based on plone test buildout version 4.3 (https://raw.github.com/collective/buildout.plonetest/master/plone-4.3.x.cfg)

We speed up this build using: https://github.com/silarsis/docker-proxy

Buildout is installed in /code

You can reuse this image like this in your dockerfile in your own buildout:

<pre>
FROM jfroche/plone:4.3
ADD . /code/
USER root
RUN chown -R plone .
USER plone
RUN bin/buildout -Nv

CMD /code/bin/instance fg
EXPOSE 8080
</pre>

You will avoid downloading all plone packages.

This image is not meant for production. We are building other images based on Relstorage for that.
