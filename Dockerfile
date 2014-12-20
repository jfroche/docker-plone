FROM jfroche/plone:4.3

ONBUILD COPY . /code/
ONBUILD USER root
ONBUILD RUN chown -R plone /code
ONBUILD USER plone
ONBUILD RUN bin/buildout -N
