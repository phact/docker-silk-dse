#docker-silk-dse

```
#setup
docker-machine start default
eval $(docker-machine env default)
#a bit of cleanup
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -aq)
#build
docker build -t silk-image .
docker run -d -p 0.0.0.0:5601:5601  --name silk silk-image
#or for debug
docker run -it  -p 0.0.0.0:5601:5601  --name silk silk-image
docker-machine ip default
```
