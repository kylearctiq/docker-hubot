FROM openshift/nodejs-010-centos7

USER root
RUN curl --silent --location https://rpm.nodesource.com/setup | bash -
RUN npm install -g npm
RUN yum install -y nodejs npm git yo generator-hubot
RUN npm install && npm install -g hubot coffee-script
RUN mkdir -p hubot
RUN cd hubot
RUN yo hubot
RUN echo "[]" > hubot/hubot-scripts.json
RUN npm install hubot-irc --save && npm install
CMD cd hubot && hubot -a irc

