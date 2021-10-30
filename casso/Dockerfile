FROM node

WORKDIR /app

COPY package.json ./

COPY index.js ./

RUN npm install

CMD [ "npm", "run", "start"]