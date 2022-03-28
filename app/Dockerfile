FROM python:3

RUN useradd -m -d /app backend
RUN apt-get update
RUN apt-get -qq install -y gettext-base
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y dos2unix

USER backend
WORKDIR /app

RUN wget -qq https://github.com/timoguic/ACIT4640-todo-app/archive/refs/heads/master.zip -O /tmp/source.zip
RUN unzip /tmp/source.zip
RUN mv ACIT4640-todo-app-master /app/src

WORKDIR /app/src

RUN npm install
RUN dos2unix
COPY backend.conf.template backend.conf
COPY database.js.template .
COPY start.sh .

RUN wget http://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod a+x wait-for-it.sh
EXPOSE 8000

CMD ["/bin/bash", "start.sh"]
#RUN npm start