FROM node:0.12.13
RUN apt-get update && apt-get install -y \
    git git-core
RUN git clone https://github.com/phact/silk.git
RUN cd silk && npm install
RUN cd silk && npm install -g grunt-cli
RUN cd silk && npm install -g bower
RUN cd silk && bower install  --allow-root
RUN cd silk && find . -name bower_components
RUN ls /silk/src/kibana/bower_components/require-css/css-builder.js
RUN cd silk && grunt build --verbose 

#Make sure you've added the IP where DSE sits to your conifig.txt
COPY config.txt .

#Assumes you already set up your silk search core manually
#RUN sed -e "s/localhost:8983/$(sed 's:/:\\/:g' config.txt)/" silk/silkconfig/conf/create_core.sh >  silk/silkconfig/conf/create_core_mod.sh
#RUN cat silk/silkconfig/conf/create_core_mod.sh
#RUN cd silk/silkconfig/conf/ && chmod +x ./create_core_mod.sh
#RUN cd silk/silkconfig/conf/ && ./create_core_mod.sh
RUN sed -i "s/solr_url: \"http:\/\/localhost:8983/solr_url: \"http:\/\/$(sed 's:/:\\/:g' config.txt)/" silk/src/server/config/kibana.yml

EXPOSE 5601

ENTRYPOINT /bin/bash ; cd silk && npm run --loglevel verbose server silk && /bin/bash
