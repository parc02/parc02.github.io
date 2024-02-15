FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git
RUN apt install cron

COPY . /var/www/html/

CMD service cron start; ["nginx", "-g", "daemon off;"]
