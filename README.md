#docker-silk-dse

Silk is lucidwork's port of Kibana V4 for Solr. This is a docker container for
running Silk on DSE Search. It assumes you have DSE (with search enabled)
running on a box that this docker container will be able to access.

Add the IP address of the DSE box in the config.txt file (**Hint**: this should not be
localhost)

##first:
    git clone https://github.com/phact/docker-silk-dse

##for OSX:

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

##for linux:
install docker https://docs.docker.com/engine/installation/linux
````
#start docker
sudo service docker start
sudo docker build -t silk-image .
sudo run -d -p 0.0.0.0:5601:5601  --name silk silk-image
````
