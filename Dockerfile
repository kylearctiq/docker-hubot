FROM openshift/nodejs-010-centos7

ENV NPM_RUN=start \
    NODEJS_VERSION=0.10 \
    NPM_CONFIG_PREFIX=$HOME/.npm-global \
    PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$PATH

RUN npm install && npm install -g hubot coffee-script
RUN hubot --create hubot
RUN echo "[]" > hubot/hubot-scripts.json
RUN apt-get install -y git
RUN cd hubot && npm install hubot-irc --save && npm install

CMD cd hubot && bin/hubot -a irc

#./bin/hubot --name HubotOpenShift
#npm install -g yo generator-hubot

