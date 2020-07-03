FROM ubuntu:bionic
MAINTAINER 837940593@qq.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget

RUN apt-get install -y default-jre
RUN apt-get install -y libfreetype6 libfreetype6-dev
RUN apt-get install -y graphviz
RUN wget http://sourceforge.net/projects/plantuml/files/plantuml.1.2020.15.jar/download -O plantuml.jar

ENV LANG C.UTF-8
RUN apt-get install -y fonts-wqy-microhei fonts-wqy-zenhei
# Use the following commands to check if wqy fonts are installed.
# RUN apt-get install -y fontconfig
# RUN fc-cache -f -v
# RUN fc-list :lang=zh

RUN apt-get purge -y wget
RUN apt-get autoremove -y

ADD plantuml-cat /usr/local/bin/plantuml-cat
RUN chmod a+x /usr/local/bin/plantuml-cat
VOLUME /work
ENTRYPOINT ["/usr/local/bin/plantuml-cat"]
