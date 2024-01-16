FROM node

WORKDIR /app

COPY package*.json ./

RUN npm install express --save

COPY . .

EXPOSE 3000

#CMD ["npm", "start"]
CMD ["node","app.js"]