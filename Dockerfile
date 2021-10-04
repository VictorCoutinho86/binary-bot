FROM python:3.9.6-slim-buster

WORKDIR /trader
COPY iq.py .
COPY testing.py .
COPY training.py .
COPY requirements.txt .

RUN apt-get update && apt-get install git -y && apt-get clean
RUN git clone https://github.com/iqoptionapi/iqoptionapi.git
RUN python iqoptionapi/setup.py install

RUN pip install --user -r requirements.txt

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD [ "python", "./testing.py" ]