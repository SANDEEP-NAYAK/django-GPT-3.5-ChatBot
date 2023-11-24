#!/bin/bash

set -x

pip3 install virtualenv

cd /aiBot

virtualenv env

source /aiBot/env/bin/activate

pip install -r ./requirements.txt

cp /aiBot/gunicorn.socket /etc/systemd/system/gunicorn.socket

cp /aiBot/gunicorn.service /etc/systemd/system/gunicorn.service

#configuring nginx reverse proxy 
cp -f /aiBot/default /etc/nginx/sites-available/default

#configuring supervisor to manage gunicorn and nginx services
cp supervisord.conf /etc/supervisor/conf.d/supervisord.conf

mkdir -p /var/log/gunicorn /var/log/nginx /var/log/supervisord

chown -R www-data:www-data /var/log/gunicorn /var/log/nginx /var/log/supervisord
