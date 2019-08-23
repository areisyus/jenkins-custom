# jenkins-custom
Custom jenkins lts with docke and maven installed

## run command
```bash
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins areisyus/jenkins-custom:latest
```
