FROM python:3.9.6-slim-buster

WORKDIR /trader
COPY iq.py .
COPY testing.py .
COPY training.py .
COPY requirements.txt .

RUN pip install --user -r requirements.txt

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD [ "python", "./testing.py" ]