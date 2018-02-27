FROM node:6

RUN mkdir parse

ADD package.json /parse
ADD jsconfig.json /parse
WORKDIR /parse
RUN npm install

ADD index.js /parse

ENV APP_ID setYourAppId
ENV MASTER_KEY setYourMasterKey
ENV DATABASE_URI setMongoDBURI

# Optional (default : 'parse/cloud/main.js')
# ENV CLOUD_CODE_MAIN cloudCodePath

# Optional (default : '/parse')
# ENV PARSE_MOUNT mountPath

EXPOSE 1337

# Uncomment if you want to access cloud code outside of your container
# A main.js file must be present, if not Parse will not start

VOLUME /parse/cloud
VOLUME /parse/public

CMD [ "npm", "start" ]
