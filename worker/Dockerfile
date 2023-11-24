FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

ENV MULT=true
ENV ADD=true
ENV PORT=8080

CMD ["node", "main.js"]
