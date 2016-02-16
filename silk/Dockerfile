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
RUN cd silk/silkconfig/conf/ && ./create_core.sh
EXPOSE 5601 
ENTRYPOINT cd silk && npm run server silk
