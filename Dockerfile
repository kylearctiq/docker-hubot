FROM openshift/nodejs:0.10

RUN npm install && npm install -g hubot coffee-script
RUN hubot --create hubot
RUN echo "[]" > hubot/hubot-scripts.json
RUN apt-get install -y git
RUN cd hubot && npm install hubot-irc --save && npm install

CMD cd hubot && bin/hubot -a irc
