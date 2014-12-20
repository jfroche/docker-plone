FROM phusion/baseimage:0.9.13

# install system packages
RUN apt-get -qy update && apt-get -qy install ruby python-pip python-dev git-core python-virtualenv libxml2-dev libxslt1-dev zlib1g-dev libjpeg-dev
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -d /code -s /bin/bash plone
RUN mkdir /code
COPY . /code
RUN chown plone /code
USER plone
WORKDIR /code
RUN virtualenv .
RUN python2.7 bootstrap.py --setuptools-version=7.0 --version=2.2.5
RUN bin/buildout

CMD /code/bin/instance fg
EXPOSE 8080
VOLUME ["/code", "/code/src", "/code/var/blobstorage", "/code/var/filestorage"]
