docker-machine start default
eval $(docker-machine env default)
docker build -t silk-image .
docker run -d -p 0.0.0.0:5601:5601  --name slik silk-image
docker-machine ip default
