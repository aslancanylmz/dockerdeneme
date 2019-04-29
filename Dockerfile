
# Pull base image.
FROM mhart/alpine-node:4

# Install build tools to compile native npm modules
RUN apk add --update build-base python

# Create app directory
RUN mkdir -p /home/aslan/myapp
COPY . /home/aslan/myapp
RUN cd /home/aslan/myapp/server && npm install --production

WORKDIR /home/aslan/myapp

ENV PORT=3000
ENV MONGO_URL=mongodb://localhost:27017/myappdb
ENV ROOT_URL=http://localhost:3000/
CMD [ "npm", "start" ]
EXPOSE 3000

