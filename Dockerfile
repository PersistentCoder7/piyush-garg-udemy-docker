FROM ubuntu

RUN apt-get update -y
RUN apt-get install curl -y

RUN curl -sL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN apt-get install -y nodejs


# copying files to the container
COPY index.js /home/app/server.js
COPY package.json /home/app/package.json
COPY package-lock.json /home/app/package-lock.json

WORKDIR /home/app/
RUN npm install


