FROM node:18-alpine3.18
WORKDIR /app
COPY . .
RUN echo 'console.log("Hello, World!");' > index.js
EXPOSE 8080
CMD ["node", "index.js"]
