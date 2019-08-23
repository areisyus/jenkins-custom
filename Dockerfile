FROM jenkins/jenkins:lts
USER root

# Update apt references
RUN apt-get update

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
