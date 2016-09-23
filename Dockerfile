FROM originate/exosphere-base

RUN npm install -g LiveScript

ADD ./package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir /exosphere-tweets-service && cp -a /tmp/node_modules /exosphere-tweets-service/

WORKDIR /exosphere-tweets-service
ADD . /exosphere-tweets-service
