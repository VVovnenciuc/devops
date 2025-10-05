# https://www.jenkins.io/doc/book/installing/docker/
# docker network create jenkins

docker stop jenkins-blueocen
docker rm jenkins-blueocen

docker run --name jenkins-blueocean --rm \
  --detach \
  --network jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean

echo "Jenkins Started"
echo -e "\n\t\t http://localhost:8080/\n"