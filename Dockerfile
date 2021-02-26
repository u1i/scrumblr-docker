FROM ubuntu:20.04
MAINTAINER uli.hitzel@gmail.com
EXPOSE 8080
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Singapore

RUN apt-get update
RUN apt-get install -y nodejs npm redis-server git
ENV USER root
RUN useradd -ms /bin/bash user
COPY start.sh /home/user/start.sh
RUN chmod a+x /home/user/start.sh
USER user
WORKDIR /home/user
CMD ["sh","/home/user/start.sh"]
