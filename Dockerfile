FROM microsoft/dotnet:2.0.4-sdk-2.1.3-stretch

RUN apt-get -y update
RUN apt-get -y install apt-utils unzip

# Required to run neo-cli
RUN apt-get -y install libleveldb-dev sqlite3 libsqlite3-dev libunwind8-dev

# Things in here should be versioned from the outside, for now:
RUN cd /tmp && \
  wget https://github.com/neo-project/neo-cli/releases/download/v2.5.2/neo-cli-ubuntu.16.10-x64.zip && \
  unzip neo-cli-ubuntu.16.10-x64.zip && \
  mv /tmp/neo-cli /usr/local/lib && \
  ls /usr/local/lib

ADD run /usr/local/bin/

RUN chmod +x /usr/local/bin/run

# The script command is required so container does not fall over when starting outside
# the usual 'docker run -t ...', I.e. when sending to k8s cluster
ENTRYPOINT ["script","-q","-c","/usr/local/bin/run"]
