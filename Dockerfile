FROM openshift/nodejs-010-centos7

USER root
#RUN curl --silent --location https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs
RUN which npm 
RUN npm install && npm install -g hubot coffee-script
RUN hubot --create hubot
RUN echo "[]" > hubot/hubot-scripts.json
RUN yum install -y git
RUN cd hubot && npm install hubot-irc --save && npm install

CMD cd hubot && bin/hubot -a irc

#./bin/hubot --name HubotOpenShift
#npm install -g yo generator-hubot

