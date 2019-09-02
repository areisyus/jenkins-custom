FROM jenkins/jenkins:lts
USER root

# Update apt references
RUN apt-get update

# Remove openJDK
RUN apt-get purge --auto-remove openjdk*

# Install Oracle Java8
RUN wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1z6m6g7NAoOts1QYwc1M3rXyZMT0rvlSK' -O jdk-8u221-linux-x64.rpm && \
 yum localinstall -y jdk-8u221-linux-x64.rpm
      
# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install the latest maven
RUN apt-get install -y maven

# Install node 8.x
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
      apt-get install -y nodejs

# Install the latest Docker CE binaries
RUN apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce
   
USER jenkins
