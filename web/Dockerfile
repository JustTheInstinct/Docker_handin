FROM nginx

RUN mkdir /etc/nginx/templates
COPY default.conf.template /etc/nginx/templates

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y systemctl

RUN wget -qq https://github.com/timoguic/ACIT4640-todo-app/archive/refs/heads/master.zip -O /tmp/source.zip
RUN unzip /tmp/source.zip
RUN mv ACIT4640-todo-app-master/public /etc/nginx

RUN cp /etc/nginx/templates/default.conf.template /etc/nginx/conf.d/default
RUN cat /etc/nginx/conf.d/default
RUN systemctl restart nginx

