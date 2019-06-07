FROM quangvien/docker-base
EXPOSE 9092

ARG kafka_version=2.2.1
ARG scala_version=2.12
ARG mirror=http://mirror.downloadvn.com/apache

RUN apt-get -y update
RUN wget ${mirror}/kafka/${kafka_version}/kafka_${scala_version}-${kafka_version}.tgz && tar xvf kafka_${scala_version}-${kafka_version}.tgz --one-top-level=kafka --strip-components=1
RUN rm kafka_${scala_version}-${kafka_version}.tgz

COPY start_broker.sh start_broker.sh
COPY server.properties ./kafka/config/server.properties

CMD ["/bin/bash", "/start_broker.sh", "&", "/bin/bash", "&"]

