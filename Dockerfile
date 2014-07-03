FROM busybox

MAINTAINER "Eliran Bivas" "http://github.com/bivas/docker-serf-wrapper"

ADD https://dl.bintray.com/mitchellh/serf/0.6.2_linux_amd64.zip serf.zip
RUN unzip serf.zip -d /usr/bin
RUN chmod +x /usr/bin/serf
RUN rm -rf serf.zip

ADD /serf-join.sh /serf-join.sh
RUN chmod +x /serf-join.sh

ENTRYPOINT ["/serf-join.sh"]
