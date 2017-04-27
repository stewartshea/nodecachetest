FROM node:4

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

ADD .npmrc /app/ 
ADD package.json /app/

RUN stat .npmrc
RUN md5sum .npmrc

RUN npm install
RUN npm install angular

ADD . /app

CMD [ "npm", "start"]