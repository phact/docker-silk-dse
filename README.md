#docker-silk-dse

Silk is lucidwork's port of Kibana V4 for Solr. This is a docker container for
running Silk on DSE Search. It assumes you have DSE (with search enabled)
running on a box that this docker container will be able to access.

**Add the IP address of the DSE box in the config.txt file (**Hint**: this should not be
localhost)**

##prepare DSE
on the machine where you are running DSE do the following.

##clone the repo:
    git clone https://github.com/phact/docker-silk-dse

Set up keyspace and table:

    wget https://raw.githubusercontent.com/phact/silk/dev/silkconfig/conf/schema.cql
    
    cqlsh -f schema.cql
    
Set up the DSE Search core before kicking off the container:
    
    chmod +x create_core.sh
    ./create_core.sh

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
docker run --net=host -d -p 0.0.0.0:5601:5601  --name silk silk-image
#or for debug
docker run -it --net=host -p 0.0.0.0:5601:5601  --name silk silk-image
docker-machine ip default
```

##for linux:
install docker https://docs.docker.com/engine/installation/linux

add your user to the docker group
    sudo gpasswd -a ${USER} docker

and refresh 
   newgrp docker 


````
#start docker
service docker start
docker build -t silk-image .
docker run -d -p 0.0.0.0:5601:5601  --name silk silk-image

#or if it's not working run without detaching to troubeshoot
docker run --net=host -p 0.0.0.0:5601:5601  --name silk silk-image
````

You'll need a DSE Search core with a date / time indexed column to get started using Silk!
