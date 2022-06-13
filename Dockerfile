FROM alpine:3.10
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apk update
RUN apk add --update nodejs npm
RUN apk add mongodb
RUN apk add mongodb-tools
COPY proshop_mern /tmp/proshop_mern
COPY .env /tmp/proshop_mern/.env
WORKDIR /tmp/proshop_mern
RUN npm install
WORKDIR /tmp/proshop_mern/frontend
RUN npm install
WORKDIR /tmp/proshop_mern
CMD npm run dev
CMD npm run server
WORKDIR /tmp/proshop_mern/frontend
CMD npm run build
EXPOSE 3000/tcp
EXPOSE 3000/udp
EXPOSE 5000/tcp
EXPOSE 5000/udp
CMD tail -f /dev/null
