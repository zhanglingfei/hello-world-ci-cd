FROM node:18-alpine3.18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
COPY public ./public
EXPOSE 8080
CMD ["node", "index.js"]
