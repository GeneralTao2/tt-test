FROM debian:11
USER root

RUN apt-get update && apt-get install -y lsb-release curl
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli docker-compose-plugin nano openjdk-17-dbg maven git
RUN git clone https://github.com/testcontainers/testcontainers-java-repro
CMD cd testcontainers-java-repro && mvn clean test