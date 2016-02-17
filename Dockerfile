FROM node:0.10.34
RUN apt-get update && apt-get install -y \
    git nodejs npm git-core
RUN git clone https://github.com/phact/silk.git
RUN npm install -g bower 
RUN cd silk && npm install grunt
RUN npm install -g grunt-cli
#other dependencies
RUN cd silk && npm install load-grunt-config lodash js-yaml glob bluebird mkdirp event-stream simple-git marked tar marked-text-renderer request grunt-contrib-clean  grunt-contrib-compress  grunt-contrib-copy  grunt-contrib-jade  grunt-contrib-jshint  grunt-contrib-less  grunt-contrib-requirejs  grunt-contrib-watch  grunt-esvm  grunt-mocha  grunt-replace  grunt-run  grunt-s3  grunt-saucelabs  grunt-simple-mocha  html-entities
RUN cd silk && bower install --allow-root
RUN cd silk && ls 
RUN cd silk && grunt build

#Make sure you've added the IP where DSE sits to your conifig.txt
COPY config.txt .
RUN sed -e "s/localhost:8983/$(sed 's:/:\\/:g' config.txt)/" silk/silkconfig/conf/create_core.sh >  silk/silkconfig/conf/create_core_mod.sh
RUN cat silk/silkconfig/conf/create_core_mod.sh
RUN cd silk/silkconfig/conf/ && chmod +x ./create_core_mod.sh
RUN cd silk/silkconfig/conf/ && ./create_core_mod.sh
RUN sed -i "s/solr_url: \"http:\/\/localhost:8983/solr_url: \"http:\/\/$(sed 's:/:\\/:g' config.txt)/" silk/src/server/config/kibana.yml

#now let's load some data to play with


EXPOSE 5601 
ENTRYPOINT cd silk && npm run server silk
