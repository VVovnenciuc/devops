FROM python:slim

ENV APP_HOST=0.0.0.0
ENV APP_PORT=5000

WORKDIR /app

COPY ./app.py /app/

COPY ./requirements.txt /app/

RUN pip install -r requirements.txt 

CMD [ "sh","-c","flask run --host=$APP_HOST --port=$APP_PORT" ]
