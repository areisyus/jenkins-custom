# jenkins-custom
Jenkins based on jenkins/jenkins:lts with docker, node 8.x and maven already installed

## run command
```bash
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins areisyus/jenkins-custom:latest
```
