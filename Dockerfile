FROM jdk8:latest
MAINTAINER rakshukla@outlook.com 
ADD http://downloads.jboss.org/infinispan/9.0.0.Final/infinispan-server-9.0.0.Final-bin.zip /opt/infinispan.zip
WORKDIR /opt
RUN unzip infinispan.zip
RUN mv infinispan-server-9.0.0.Final infinispan
CMD /opt/infinispan/bin/standalone.sh --server-config=clustered.xml -Djboss.default.jgroups.stack=tcp-gossip -Djgroups.gossip.initial_hosts=$router_server_list -Djboss.bind.address=$public_bind_ip 
