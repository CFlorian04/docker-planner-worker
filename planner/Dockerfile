FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

ENV PORT=3000
ENV TASKS=20

CMD ["node", "main.js"]