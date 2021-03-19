FROM node:12
WORKDIR /opt/app
COPY addressbook/ .
RUN npm install
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]
