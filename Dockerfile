FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git
RUN apt install cron
RUN rm -rf /var/www/html

RUN git clone https://github.com/parc02/parc02.github.io.git /var/www/html

COPY pull.sh /var/www/html/
COPY blog-pull-cronjob /etc/cron.d


RUN crontab /etc/cron.d/blog-pull-cronjob
RUN crontab -l

CMD service cron start; nginx -g 'daemon off;'
