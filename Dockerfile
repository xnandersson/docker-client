# Version 0.1
FROM ubuntu:trusty
MAINTAINER Niklas Andersson <niklas.andersson@openforce.se>
ENV REFRESHED_AT 2014-08-28-2
RUN apt-get update -yqq
RUN apt-get install ruby1.9.1-dev puppet
RUN gem install librarian-puppet-simple
COPY Puppetfile /etc/puppet/Puppetfile
COPY manifest.pp /etc/puppet/manifests/manifest.pp
WORKDIR /etc/puppet
RUN librarian-puppet install
ENTRYPOINT /usr/bin/puppet apply /etc/puppet/manifests/manifest.pp
