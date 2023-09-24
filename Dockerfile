FROM python:3.10

WORKDIR /aiBot

COPY . /aiBot/

RUN chmod +x envSetup.sh && \
    ./envSetup.sh

EXPOSE 80

ENV DJANGO_SETTINGS_MODULE=django_chatbot.settings

CMD systemctl restart nginx gunicorn
