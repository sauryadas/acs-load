FROM ruby:2.3

RUN apt-get -qq update 
RUN apt-get -y -qq upgrade
RUN apt-get -y -qq install openjdk-7-jre-headless wget 
RUN wget -q http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-2.13.tgz
RUN tar -xzf apache-jmeter-2.13.tgz && \
    rm apache-jmeter-2.13.tgz && \
    mv apache-jmeter-2.13 /usr/local/jmeter 

EXPOSE 1099 4445

RUN gem install ruby-jmeter

COPY /scripts /scripts

WORKDIR /scripts

ENV PATH /scripts:/usr/local/jmeter/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENTRYPOINT ["runTest.sh"]
