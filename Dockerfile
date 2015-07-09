FROM phusion/baseimage:0.9.13

# install system packages
RUN add-apt-repository ppa:fkrull/deadsnakes && apt-get update && apt-get install -y python2.4 python2.4-dev python-pip python-pip git-core libxml2-dev libxslt1-dev zlib1g-dev libjpeg-dev
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -d /code -s /bin/bash plone
RUN mkdir /code
COPY . /code
RUN chown plone /code
USER plone
WORKDIR /code
RUN python2.4 bootstrap.py
RUN bin/buildout
USER root
RUN apt-get remove -y g++-4.8 gcc-4.8 cpp-4.8 perl perl-modules
USER plone
ENV HOME /code
CMD /code/bin/instance fg
EXPOSE 8080

VOLUME ["/code/var/blobstorage", "/code/var/filestorage"]
